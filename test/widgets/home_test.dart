import 'package:flutter_test/flutter_test.dart';
import 'package:voice_saathi/core/language.dart';
import 'package:voice_saathi/core/platform/permissions.dart';
import 'package:voice_saathi/core/platform/phone.dart';
import 'package:voice_saathi/core/platform/speech_recognizer.dart';
import 'package:voice_saathi/features/assistant/presentation/assistant_controller.dart';
import 'package:voice_saathi/features/settings/domain/app_settings.dart';
import 'package:voice_saathi/features/settings/presentation/settings_controller.dart';

import '../helpers/pump_app.dart';

Future<void> pressSpeak(WidgetTester tester) async {
  await tester.tap(find.bySemanticsLabel('Press and speak'));
  await TestApp.settle(tester);
}

/// The list builds lazily, so the Help key is scrolled into view first.
Future<void> pressHelp(WidgetTester tester) async {
  await tester.scrollUntilVisible(find.text('Help'), 300);
  final help = find.bySemanticsLabel(RegExp('^Help'));
  await tester.ensureVisible(help);
  await tester.pump();
  await tester.tap(help);
  await TestApp.settle(tester);
}

void main() {
  testWidgets('shows the time, date and a key per family member', (
    tester,
  ) async {
    final app = TestApp();
    await app.pump(tester);

    expect(find.text('10:35 AM'), findsOneWidget);
    expect(find.text('Sunday, 15 November'), findsOneWidget);
    expect(find.text('Press and speak'), findsOneWidget);
    expect(find.text('Ravi'), findsOneWidget);
    expect(find.text('Lata'), findsOneWidget);
    expect(find.text('Kiran'), findsOneWidget);
  });

  testWidgets('without family numbers it says to ask the family', (
    tester,
  ) async {
    final app = TestApp(contacts: const []);
    await app.pump(tester);

    expect(
      find.text('No family numbers yet. Ask your family to open Family setup.'),
      findsOneWidget,
    );
  });

  testWidgets('tapping a photo says who is being called, then calls', (
    tester,
  ) async {
    final app = TestApp();
    await app.pump(tester);

    await tester.tap(find.bySemanticsLabel('Call Lata'));
    await TestApp.settle(tester);

    expect(app.speech.spoken, ['Calling Lata.']);
    expect(app.phoneService.called, ['9800000002']);
  });

  testWidgets('without the Phone permission it explains the dialer', (
    tester,
  ) async {
    final app = TestApp(phone: false);
    await app.pump(tester);

    await tester.tap(find.bySemanticsLabel('Call Ravi'));
    await TestApp.settle(tester);

    expect(app.speech.spoken, ['Press the green button to call Ravi.']);
    expect(app.phoneService.called, ['9800000001']);
  });

  testWidgets('a failed call is said aloud', (tester) async {
    final app = TestApp();
    app.phoneService.outcome = CallOutcome.failed;
    await app.pump(tester);

    await tester.tap(find.bySemanticsLabel('Call Ravi'));
    await TestApp.settle(tester);

    expect(app.speech.spoken.last, 'I could not call Ravi. Please try again.');
  });

  group('speaking', () {
    testWidgets('"what time is it" is answered aloud and on the display', (
      tester,
    ) async {
      final app = TestApp();
      app.recognizer.results.add(const Heard(['what time is it']));
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.recognizer.listenedIn, ['en-IN']);
      expect(app.speech.spoken, ['It is 10:35 in the morning.']);
      expect(find.text('You said: “what time is it”'), findsOneWidget);
      expect(find.text('It is 10:35 in the morning.'), findsOneWidget);
    });

    testWidgets('a name calls that person', (tester) async {
      final app = TestApp();
      app.recognizer.results.add(const Heard(['call pedda abbayi']));
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.speech.spoken, ['Calling Ravi.']);
      expect(app.phoneService.called, ['9800000001']);
    });

    testWidgets('"call" with no known name asks whom to call', (tester) async {
      final app = TestApp();
      app.recognizer.results.add(const Heard(['call the doctor']));
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.speech.spoken, [
        'Whom should I call? Say the name, or tap a photo.',
      ]);
      expect(app.phoneService.called, isEmpty);
    });

    testWidgets('the date', (tester) async {
      final app = TestApp();
      app.recognizer.results.add(const Heard(['what day is today']));
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.speech.spoken, ['Today is Sunday, 15 November.']);
    });

    testWidgets('low battery asks to charge', (tester) async {
      final app = TestApp();
      app.phoneService.level = const BatteryLevel(percent: 15, charging: false);
      app.recognizer.results.add(const Heard(['battery']));
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.speech.spoken, [
        'The battery is at 15 percent. Please put the phone on charge.',
      ]);
    });

    testWidgets('charging battery says so', (tester) async {
      final app = TestApp();
      app.phoneService.level = const BatteryLevel(percent: 15, charging: true);
      app.recognizer.results.add(const Heard(['battery']));
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.speech.spoken, [
        'The battery is at 15 percent. It is charging.',
      ]);
    });

    testWidgets('torch on and off, and phones without a flash', (tester) async {
      final app = TestApp();
      app.recognizer.results.addAll(const [
        Heard(['light on']),
        Heard(['light off']),
        Heard(['torch']),
      ]);
      await app.pump(tester);

      await pressSpeak(tester);
      expect(app.phoneService.torchOn, isTrue);
      await pressSpeak(tester);
      expect(app.phoneService.torchOn, isFalse);
      app.phoneService.hasTorch = false;
      await pressSpeak(tester);

      expect(app.speech.spoken, [
        'The light is on.',
        'The light is off.',
        'This phone has no light I can turn on.',
      ]);
    });

    testWidgets('nonsense is not acted on', (tester) async {
      final app = TestApp();
      app.recognizer.results.add(const Heard(['play a song']));
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.speech.spoken.single, startsWith('Sorry, I did not'));
      expect(app.phoneService.called, isEmpty);
    });

    testWidgets('silence', (tester) async {
      final app = TestApp();
      app.recognizer.results.add(const HeardNothing());
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.speech.spoken, [
        'I did not hear anything. Press the button and speak.',
      ]);
    });

    testWidgets('no offline recogniser and online not allowed', (tester) async {
      final app = TestApp();
      app.recognizer.results.add(const ListenFailed(SpeechError.needsOnline));
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.speech.spoken.single, startsWith('Listening is not ready'));
    });

    testWidgets('online listening is passed through when allowed', (
      tester,
    ) async {
      final app = TestApp(
        settings: const AppSettings(onboarded: true, allowOnline: true),
      );
      app.recognizer.results.add(const ListenFailed(SpeechError.network));
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.recognizer.allowOnlineFlags, [true]);
      expect(app.speech.spoken.single, startsWith('I need the internet'));
    });

    testWidgets('asks for the microphone, and explains if refused', (
      tester,
    ) async {
      final app = TestApp(microphone: false);
      app.permissions.grantOnRequest = false;
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.permissions.requested, [AppPermission.microphone]);
      expect(app.recognizer.listenedIn, isEmpty);
      expect(app.speech.spoken.single, startsWith('I need the microphone'));
    });
  });

  group('Help', () {
    testWidgets('calls the first Help person, then offers the next', (
      tester,
    ) async {
      final app = TestApp();
      await app.pump(tester);

      await pressHelp(tester);
      expect(app.speech.spoken, ['Calling Ravi for help.']);
      expect(app.phoneService.called, ['9800000001']);
      expect(find.text('Did Ravi answer?'), findsOneWidget);

      // Back from the call.
      await app.container.read(assistantProvider.notifier).onResumed();
      await TestApp.settle(tester);
      expect(
        app.speech.spoken.last,
        'If Ravi did not answer, press the red Help button to call Lata.',
      );

      await tester.tap(find.bySemanticsLabel('Call Lata').first);
      await TestApp.settle(tester);
      expect(app.phoneService.called, ['9800000001', '9800000002']);
      expect(app.speech.spoken.last, 'Calling Lata for help.');
      // Lata was the last Help person: no further offer.
      expect(find.textContaining('answer?'), findsNothing);
    });

    testWidgets('"I\'m fine" clears the offer and the display', (tester) async {
      final app = TestApp();
      await app.pump(tester);

      await pressHelp(tester);
      await tester.tap(find.text("Yes, I'm fine"));
      await TestApp.settle(tester);

      expect(find.text('Did Ravi answer?'), findsNothing);
      expect(find.text('Calling Ravi for help.'), findsNothing);
      // Coming back now says nothing more.
      await app.container.read(assistantProvider.notifier).onResumed();
      await TestApp.settle(tester);
      expect(app.speech.spoken, ['Calling Ravi for help.']);
    });

    testWidgets('spoken "help" works like the red key', (tester) async {
      final app = TestApp();
      app.recognizer.results.add(const Heard(['help']));
      await app.pump(tester);

      await pressSpeak(tester);

      expect(app.phoneService.called, ['9800000001']);
    });

    testWidgets('nobody marked for Help', (tester) async {
      final app = TestApp(contacts: const [kiran]);
      await app.pump(tester);

      await pressHelp(tester);

      expect(app.phoneService.called, isEmpty);
      expect(app.speech.spoken.single, startsWith('No one is set up for Help'));
    });
  });

  group('Telugu', () {
    testWidgets('listens, answers and shows Telugu', (tester) async {
      final app = TestApp(
        settings: const AppSettings(
          onboarded: true,
          language: AppLanguage.telugu,
        ),
        now: DateTime(2026, 11, 15, 19, 5),
      );
      app.recognizer.results.add(const Heard(['టైం ఎంత అయింది']));
      await app.pump(tester);

      expect(find.text('నొక్కి మాట్లాడండి'), findsOneWidget);
      await tester.tap(find.bySemanticsLabel('నొక్కి మాట్లాడండి'));
      await TestApp.settle(tester);

      expect(app.recognizer.listenedIn, ['te-IN']);
      expect(app.speech.locales, ['te-IN']);
      // 7 in the evening is "సాయంత్రం" (17:00–20:00).
      expect(app.speech.spoken, ['ఇప్పుడు సమయం సాయంత్రం 7:05.']);
    });

    testWidgets('a Telugu nickname calls the right person', (tester) async {
      final app = TestApp(
        settings: const AppSettings(
          onboarded: true,
          language: AppLanguage.telugu,
        ),
      );
      app.recognizer.results.add(const Heard(['లతకి ఫోన్ చెయ్యి']));
      await app.pump(tester);

      await tester.tap(find.bySemanticsLabel('నొక్కి మాట్లాడండి'));
      await TestApp.settle(tester);

      expect(app.phoneService.called, ['9800000002']);
      expect(app.speech.spoken, ['Lataకి కాల్ చేస్తున్నాను.']);
    });
  });

  testWidgets('changing the language clears the old reply', (tester) async {
    final app = TestApp();
    app.recognizer.results.add(const Heard(['what time is it']));
    await app.pump(tester);
    await pressSpeak(tester);
    expect(find.text('It is 10:35 in the morning.'), findsOneWidget);

    await app.container
        .read(settingsProvider.notifier)
        .setLanguage(AppLanguage.hindi);
    await TestApp.settle(tester);

    expect(find.text('It is 10:35 in the morning.'), findsNothing);
    expect(find.text('दबाकर बोलिए'), findsOneWidget);
  });

  testWidgets('Family setup opens only on a long press', (tester) async {
    final app = TestApp();
    await app.pump(tester);
    final setup = find.text('Family setup');
    await tester.scrollUntilVisible(setup, 300);
    await tester.ensureVisible(setup);
    await tester.pump();

    final intro = find.textContaining('Set this up once');
    await tester.tap(setup);
    await TestApp.settle(tester);
    expect(intro, findsNothing);

    await tester.longPress(setup);
    await TestApp.settle(tester);
    expect(intro, findsOneWidget);
  });
}

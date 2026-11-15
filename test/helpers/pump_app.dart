import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:voice_saathi/app/app.dart';
import 'package:voice_saathi/core/providers.dart';
import 'package:voice_saathi/features/family/domain/contact.dart';
import 'package:voice_saathi/features/settings/domain/app_settings.dart';

import 'fakes.dart';

const ravi = Contact(
  id: 'ravi',
  name: 'Ravi',
  phone: '9800000001',
  nicknames: ['pedda abbayi', 'రవి'],
  forHelp: true,
);
const lata = Contact(
  id: 'lata',
  name: 'Lata',
  phone: '9800000002',
  nicknames: ['లత'],
  forHelp: true,
);
const kiran = Contact(id: 'kiran', name: 'Kiran', phone: '9800000003');

/// The real app with fake platform services.
class TestApp {
  TestApp({
    List<Contact> contacts = const [ravi, lata, kiran],
    AppSettings settings = const AppSettings(onboarded: true),
    DateTime? now,
    bool microphone = true,
    bool phone = true,
  }) : contacts = FakeContactRepository(contacts),
       settings = FakeSettingsRepository(settings),
       clock = FakeClock(now ?? DateTime(2026, 11, 15, 10, 35)),
       permissions = FakePermissions(microphone: microphone, phone: phone);

  final FakeContactRepository contacts;
  final FakeSettingsRepository settings;
  final FakeClock clock;
  final FakePermissions permissions;
  final speech = FakeSpeech();
  final recognizer = FakeRecognizer();
  final phoneService = FakePhone();
  final photos = FakePhotoPicker();
  late ProviderContainer container;

  List<Override> get overrides => [
    clockProvider.overrideWithValue(clock),
    speechServiceProvider.overrideWithValue(speech),
    speechRecognizerProvider.overrideWithValue(recognizer),
    phoneProvider.overrideWithValue(phoneService),
    permissionsProvider.overrideWithValue(permissions),
    photoPickerProvider.overrideWithValue(photos),
    contactRepositoryProvider.overrideWithValue(contacts),
    settingsRepositoryProvider.overrideWithValue(settings),
  ];

  Future<void> pump(
    WidgetTester tester, {
    String location = '/',
    Size size = const Size(412, 915),
    double textScale = 1,
  }) async {
    await initializeDateFormatting();
    tester.view.physicalSize = size * 2.625;
    tester.view.devicePixelRatio = 2.625;
    tester.platformDispatcher.textScaleFactorTestValue = textScale;
    addTearDown(tester.view.reset);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    addTearDown(recognizer.dispose);
    container = ProviderContainer.test(overrides: overrides);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: VoiceSaathiApp(initialLocation: location),
      ),
    );
    await settle(tester);
  }

  /// Lets futures and frames finish without waiting on endless animations.
  static Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }
}

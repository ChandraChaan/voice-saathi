// Runs on a phone or emulator: flutter test integration_test
//
// Checks the Kotlin side of the app (lib/core/platform/) answers the way the
// Dart side expects. What the answers are depends on the phone, so it checks
// shapes and ranges, and prints the values.
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:voice_saathi/core/language.dart';
import 'package:voice_saathi/core/platform/phone.dart';
import 'package:voice_saathi/core/platform/speech_recognizer.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('battery level is a percentage', (tester) async {
    final battery = await const ChannelPhone().battery();
    // ignore: avoid_print
    print('battery: ${battery.percent}% charging=${battery.charging}');
    expect(battery.percent, inInclusiveRange(0, 100));
  });

  testWidgets('torch answers whether it worked', (tester) async {
    const phone = ChannelPhone();
    final on = await phone.setTorch(on: true);
    final off = await phone.setTorch(on: false);
    // ignore: avoid_print
    print('torch on=$on off=$off');
    expect(on, off, reason: 'a phone either has a usable flash or not');
  });

  testWidgets('speech status answers for every language', (tester) async {
    final recognizer = ChannelSpeechRecognizer();
    for (final language in AppLanguage.values) {
      final status = await recognizer.status(language.localeTag);
      // ignore: avoid_print
      print(
        '${language.localeTag}: onDevice=${status.onDevice} '
        'any=${status.anyRecognizer} offline=${status.offline.name}',
      );
      if (!status.onDevice) {
        expect(status.offline, OfflineSpeech.unsupported);
      }
    }
  });

  testWidgets('listening without on-device or online says so', (tester) async {
    final recognizer = ChannelSpeechRecognizer();
    final status = await recognizer.status('te-IN');
    if (status.onDevice) return; // Needs a phone without on-device speech.
    final result = await recognizer.listen('te-IN', allowOnline: false);
    expect(result, isA<ListenFailed>());
  });
}

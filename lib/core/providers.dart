import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/family/domain/contact.dart';
import '../features/settings/domain/app_settings.dart';
import 'platform/permissions.dart';
import 'platform/phone.dart';
import 'platform/photo_picker.dart';
import 'platform/speech_recognizer.dart';
import 'speech/speech_service.dart';
import 'time/clock.dart';

// Every service is overridden in main() with the real implementation and in
// tests with a fake, so nothing here touches the platform by default.

final clockProvider = Provider<Clock>((ref) => const SystemClock());

final speechServiceProvider = Provider<SpeechService>(
  (ref) => throw UnimplementedError('Override speechServiceProvider'),
);

final speechRecognizerProvider = Provider<SpeechRecognizer>(
  (ref) => throw UnimplementedError('Override speechRecognizerProvider'),
);

final phoneProvider = Provider<Phone>(
  (ref) => throw UnimplementedError('Override phoneProvider'),
);

final permissionsProvider = Provider<Permissions>(
  (ref) => throw UnimplementedError('Override permissionsProvider'),
);

final photoPickerProvider = Provider<PhotoPicker>(
  (ref) => throw UnimplementedError('Override photoPickerProvider'),
);

final contactRepositoryProvider = Provider<ContactRepository>(
  (ref) => throw UnimplementedError('Override contactRepositoryProvider'),
);

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => throw UnimplementedError('Override settingsRepositoryProvider'),
);

/// The current time, updated every 15 seconds for the display.
final nowProvider = StreamProvider<DateTime>((ref) {
  final clock = ref.watch(clockProvider);
  return Stream<DateTime>.periodic(
    const Duration(seconds: 15),
    (_) => clock.now(),
  ).startWith(clock.now());
});

extension<T> on Stream<T> {
  Stream<T> startWith(T first) async* {
    yield first;
    yield* this;
  }
}

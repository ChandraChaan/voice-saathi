import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/language.dart';
import '../../../core/platform/permissions.dart';
import '../../../core/platform/speech_recognizer.dart';
import '../../../core/providers.dart';
import '../domain/app_settings.dart';

final settingsProvider = AsyncNotifierProvider<SettingsController, AppSettings>(
  SettingsController.new,
);

class SettingsController extends AsyncNotifier<AppSettings> {
  @override
  Future<AppSettings> build() => ref.watch(settingsRepositoryProvider).load();

  Future<void> _update(AppSettings Function(AppSettings) change) async {
    final current = state.value ?? await future;
    final next = change(current);
    if (!ref.mounted) return;
    state = AsyncData(next);
    await ref.read(settingsRepositoryProvider).save(next);
  }

  Future<void> setLanguage(AppLanguage language) =>
      _update((s) => s.copyWith(language: language));

  Future<void> setAllowOnline(bool allow) =>
      _update((s) => s.copyWith(allowOnline: allow));

  Future<void> finishWelcome(AppLanguage language) =>
      _update((s) => s.copyWith(language: language, onboarded: true));
}

/// The language in use; English until settings have loaded.
final languageProvider = Provider<AppLanguage>(
  (ref) => ref.watch(settingsProvider).value?.language ?? AppLanguage.english,
);

/// Whether this phone can listen in the chosen language, and how privately.
/// Invalidated when the app comes back to the foreground.
final recognizerStatusProvider = FutureProvider<RecognizerStatus>((ref) {
  final language = ref.watch(languageProvider);
  return ref.watch(speechRecognizerProvider).status(language.localeTag);
});

/// Whether the phone has a text-to-speech voice for the chosen language.
final hasVoiceProvider = FutureProvider<bool>((ref) {
  final language = ref.watch(languageProvider);
  return ref.watch(speechServiceProvider).hasVoice(language.localeTag);
});

/// Which runtime permissions are granted. Invalidated on resume.
final permissionStatusProvider = FutureProvider<Map<AppPermission, bool>>((
  ref,
) async {
  final permissions = ref.watch(permissionsProvider);
  return {
    for (final permission in AppPermission.values)
      permission: await permissions.isGranted(permission),
  };
});

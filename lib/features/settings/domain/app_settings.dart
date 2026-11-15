import 'package:meta/meta.dart';

import '../../../core/language.dart';

@immutable
class AppSettings {
  const AppSettings({
    this.onboarded = false,
    this.language = AppLanguage.english,
    this.allowOnline = false,
  });

  factory AppSettings.fromJson(Map<String, Object?> json) => AppSettings(
    onboarded: json['onboarded'] as bool? ?? false,
    language: AppLanguage.fromCode(json['language'] as String?),
    allowOnline: json['allowOnline'] as bool? ?? false,
  );

  /// The family finished the first-run screen.
  final bool onboarded;

  /// What the app shows, speaks and listens in.
  final AppLanguage language;

  /// Whether the phone's online recogniser (usually Google's) may be used
  /// when the language can't be recognised on the phone. Off by default:
  /// online recognition sends the parent's voice to the recogniser's servers.
  final bool allowOnline;

  AppSettings copyWith({
    bool? onboarded,
    AppLanguage? language,
    bool? allowOnline,
  }) => AppSettings(
    onboarded: onboarded ?? this.onboarded,
    language: language ?? this.language,
    allowOnline: allowOnline ?? this.allowOnline,
  );

  Map<String, Object?> toJson() => {
    'onboarded': onboarded,
    'language': language.code,
    'allowOnline': allowOnline,
  };

  @override
  bool operator ==(Object other) =>
      other is AppSettings &&
      other.onboarded == onboarded &&
      other.language == language &&
      other.allowOnline == allowOnline;

  @override
  int get hashCode => Object.hash(onboarded, language, allowOnline);
}

abstract interface class SettingsRepository {
  Future<AppSettings> load();

  Future<void> save(AppSettings settings);
}

/// The languages the app speaks, listens in and shows.
enum AppLanguage {
  english('en', 'en-IN'),
  telugu('te', 'te-IN'),
  hindi('hi', 'hi-IN');

  const AppLanguage(this.code, this.localeTag);

  /// The app's own locale code, for example `te`.
  final String code;

  /// The BCP 47 tag used for speaking and listening, for example `te-IN`.
  final String localeTag;

  static AppLanguage fromCode(String? code) => AppLanguage.values.firstWhere(
    (language) => language.code == code,
    orElse: () => AppLanguage.english,
  );
}

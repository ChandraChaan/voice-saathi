import '../../../core/storage/json_file_store.dart';
import '../domain/app_settings.dart';

class FileSettingsRepository implements SettingsRepository {
  FileSettingsRepository(this._store);

  final JsonFileStore _store;

  @override
  Future<AppSettings> load() async {
    final json = await _store.read('settings');
    if (json is! Map) return const AppSettings();
    return AppSettings.fromJson(json.cast<String, Object?>());
  }

  @override
  Future<void> save(AppSettings settings) =>
      _store.write('settings', settings.toJson());
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';
import 'core/platform/permissions.dart';
import 'core/platform/phone.dart';
import 'core/platform/photo_picker.dart';
import 'core/platform/speech_recognizer.dart';
import 'core/providers.dart';
import 'core/speech/speech_service.dart';
import 'core/storage/json_file_store.dart';
import 'features/family/data/file_contact_repository.dart';
import 'features/settings/data/file_settings_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  final support = await getApplicationSupportDirectory();
  final store = JsonFileStore(Directory('${support.path}/data'));
  final settingsRepository = FileSettingsRepository(store);
  final settings = await settingsRepository.load();
  runApp(
    ProviderScope(
      overrides: [
        speechServiceProvider.overrideWithValue(TtsSpeechService()),
        speechRecognizerProvider.overrideWithValue(ChannelSpeechRecognizer()),
        phoneProvider.overrideWithValue(const ChannelPhone()),
        permissionsProvider.overrideWithValue(
          const PermissionHandlerPermissions(),
        ),
        photoPickerProvider.overrideWithValue(ImagePickerPhotoPicker()),
        contactRepositoryProvider.overrideWithValue(
          FileContactRepository(store),
        ),
        settingsRepositoryProvider.overrideWithValue(settingsRepository),
      ],
      child: VoiceSaathiApp(
        initialLocation: settings.onboarded ? '/' : '/welcome',
      ),
    ),
  );
}

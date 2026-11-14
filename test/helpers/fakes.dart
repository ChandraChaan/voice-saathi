import 'dart:async';

import 'package:voice_saathi/core/platform/permissions.dart';
import 'package:voice_saathi/core/platform/phone.dart';
import 'package:voice_saathi/core/platform/photo_picker.dart';
import 'package:voice_saathi/core/platform/speech_recognizer.dart';
import 'package:voice_saathi/core/speech/speech_service.dart';
import 'package:voice_saathi/core/time/clock.dart';
import 'package:voice_saathi/features/family/domain/contact.dart';
import 'package:voice_saathi/features/settings/domain/app_settings.dart';

class FakeClock implements Clock {
  FakeClock(this.time);

  DateTime time;

  @override
  DateTime now() => time;
}

/// Records what was spoken; speaking finishes at once.
class FakeSpeech implements SpeechService {
  final spoken = <String>[];
  final locales = <String>[];
  bool voiceAvailable = true;

  @override
  Future<bool> hasVoice(String localeTag) async => voiceAvailable;

  @override
  Future<void> speak(String text, String localeTag) async {
    spoken.add(text);
    locales.add(localeTag);
  }

  @override
  Future<void> stop() async {}
}

/// Answers each [listen] with the next queued result.
class FakeRecognizer implements SpeechRecognizer {
  final results = <HeardResult>[];
  final listenedIn = <String>[];
  final allowOnlineFlags = <bool>[];
  final downloads = <String>[];
  RecognizerStatus currentStatus = const RecognizerStatus(
    onDevice: true,
    anyRecognizer: true,
    offline: OfflineSpeech.installed,
  );
  bool downloadWorks = true;
  final _partial = StreamController<String>.broadcast();

  @override
  Stream<String> get partial => _partial.stream;

  @override
  Future<RecognizerStatus> status(String localeTag) async => currentStatus;

  @override
  Future<bool> downloadOffline(String localeTag) async {
    downloads.add(localeTag);
    return downloadWorks;
  }

  @override
  Future<HeardResult> listen(
    String localeTag, {
    required bool allowOnline,
  }) async {
    listenedIn.add(localeTag);
    allowOnlineFlags.add(allowOnline);
    return results.isEmpty ? const HeardNothing() : results.removeAt(0);
  }

  @override
  Future<void> cancel() async {}

  Future<void> dispose() => _partial.close();
}

class FakePhone implements Phone {
  final called = <String>[];
  CallOutcome outcome = CallOutcome.called;
  BatteryLevel level = const BatteryLevel(percent: 80, charging: false);
  bool hasTorch = true;
  bool? torchOn;

  @override
  Future<CallOutcome> call(String number) async {
    called.add(number);
    return outcome;
  }

  @override
  Future<BatteryLevel> battery() async => level;

  @override
  Future<bool> setTorch({required bool on}) async {
    if (!hasTorch) return false;
    torchOn = on;
    return true;
  }
}

class FakePermissions implements Permissions {
  FakePermissions({this.microphone = true, this.phone = true});

  bool microphone;
  bool phone;

  /// What a request returns (and grants).
  bool grantOnRequest = true;
  final requested = <AppPermission>[];

  @override
  Future<bool> isGranted(AppPermission permission) async =>
      switch (permission) {
        AppPermission.microphone => microphone,
        AppPermission.phone => phone,
      };

  @override
  Future<bool> request(AppPermission permission) async {
    requested.add(permission);
    if (grantOnRequest) {
      switch (permission) {
        case AppPermission.microphone:
          microphone = true;
        case AppPermission.phone:
          phone = true;
      }
    }
    return grantOnRequest;
  }
}

class FakePhotoPicker implements PhotoPicker {
  String? next;

  @override
  Future<String?> pick(PhotoSource source) async => next;
}

class FakeContactRepository implements ContactRepository {
  FakeContactRepository([List<Contact> initial = const []])
    : contacts = [...initial];

  List<Contact> contacts;

  @override
  Future<List<Contact>> loadAll() async => [...contacts];

  @override
  Future<void> saveAll(List<Contact> contacts) async =>
      this.contacts = [...contacts];
}

class FakeSettingsRepository implements SettingsRepository {
  FakeSettingsRepository(this.settings);

  AppSettings settings;

  @override
  Future<AppSettings> load() async => settings;

  @override
  Future<void> save(AppSettings settings) async => this.settings = settings;
}

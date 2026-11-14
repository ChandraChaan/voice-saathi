// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Voice Saathi';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageTelugu => 'తెలుగు';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get speakButton => 'Press and speak';

  @override
  String get listening => 'Listening…';

  @override
  String get tapToStop => 'Press again to stop';

  @override
  String get thinking => 'One moment…';

  @override
  String youSaid(String text) {
    return 'You said: “$text”';
  }

  @override
  String get familyHeading => 'Tap a photo to call';

  @override
  String get helpButton => 'Help';

  @override
  String get helpButtonHint => 'Calls family for help';

  @override
  String get familySetup => 'Family setup';

  @override
  String get holdToOpen => 'Press and hold to open';

  @override
  String get noContactsYet =>
      'No family numbers yet. Ask your family to open Family setup.';

  @override
  String callName(String name) {
    return 'Call $name';
  }

  @override
  String helpNextTitle(String name) {
    return 'Did $name answer?';
  }

  @override
  String get helpFine => 'Yes, I\'m fine';

  @override
  String get partMorning => 'in the morning';

  @override
  String get partAfternoon => 'in the afternoon';

  @override
  String get partEvening => 'in the evening';

  @override
  String get partNight => 'at night';

  @override
  String sayCalling(String name) {
    return 'Calling $name.';
  }

  @override
  String sayDialer(String name) {
    return 'Press the green button to call $name.';
  }

  @override
  String sayCallFailed(String name) {
    return 'I could not call $name. Please try again.';
  }

  @override
  String sayCallingForHelp(String name) {
    return 'Calling $name for help.';
  }

  @override
  String sayHelpNext(String name, String next) {
    return 'If $name did not answer, press the red Help button to call $next.';
  }

  @override
  String get sayNoHelpContacts =>
      'No one is set up for Help yet. Please ask your family to set it up.';

  @override
  String get sayWhom => 'Whom should I call? Say the name, or tap a photo.';

  @override
  String sayTime(String clock, String part) {
    return 'It is $clock $part.';
  }

  @override
  String sayDate(String weekday, String date) {
    return 'Today is $weekday, $date.';
  }

  @override
  String sayBattery(int percent) {
    return 'The battery is at $percent percent.';
  }

  @override
  String get sayCharging => 'It is charging.';

  @override
  String get sayChargeSoon => 'Please put the phone on charge.';

  @override
  String get sayBatteryUnknown => 'I could not read the battery.';

  @override
  String get sayTorchOn => 'The light is on.';

  @override
  String get sayTorchOff => 'The light is off.';

  @override
  String get sayNoTorch => 'This phone has no light I can turn on.';

  @override
  String get sayNotUnderstood =>
      'Sorry, I did not understand. Press the button and say it again, or tap a photo to call.';

  @override
  String get sayHeardNothing =>
      'I did not hear anything. Press the button and speak.';

  @override
  String get sayVoiceNotReady =>
      'Listening is not ready on this phone yet. Please ask your family to open Family setup. You can still tap a photo to call.';

  @override
  String get sayNoInternet =>
      'I need the internet to understand you on this phone. Please try again, or tap a photo to call.';

  @override
  String get sayMicDenied =>
      'I need the microphone to listen. Please ask your family to allow it in Family setup.';

  @override
  String get sayTryAgain =>
      'Something went wrong. Please press the button again.';

  @override
  String get setupIntro =>
      'Set this up once for your parent. Add the people they call most. The red Help button calls the people marked Help, from the top of the list.';

  @override
  String get languageHeading => 'Language';

  @override
  String get familyMembers => 'Family members';

  @override
  String get addContact => 'Add a person';

  @override
  String get reorderHint => 'Drag the handle on the right to change the order.';

  @override
  String get speechHeading => 'Listening';

  @override
  String speechOffline(String language) {
    return '$language is understood on this phone, without internet. Nothing your parent says leaves the phone.';
  }

  @override
  String speechDownloading(String language) {
    return 'Google is downloading $language for offline use. This can take a few minutes on Wi-Fi.';
  }

  @override
  String speechDownloadable(String language) {
    return '$language can be understood without internet after a one-time download from Google.';
  }

  @override
  String speechDownload(String language) {
    return 'Download $language';
  }

  @override
  String get speechDownloadStarted =>
      'Follow the phone\'s prompt to download. Keep the phone on Wi-Fi for a few minutes.';

  @override
  String get speechDownloadFailed =>
      'This phone can\'t download it. Turn on online listening below instead.';

  @override
  String speechOnlineOnly(String language) {
    return 'This phone can\'t understand $language without internet.';
  }

  @override
  String speechUnknown(String language) {
    return 'This phone understands speech on its own, but can\'t tell whether $language is ready. Try the big button.';
  }

  @override
  String get speechNone =>
      'This phone has no speech recognition. Install or update the Google app, or use the photos to call.';

  @override
  String get allowOnline => 'Allow online listening';

  @override
  String get allowOnlineDetail =>
      'Uses the phone\'s Google speech service, which sends what your parent says to Google to turn it into text. Only used when the phone can\'t do it alone.';

  @override
  String get voiceHeading => 'Voice';

  @override
  String get hearSample => 'Hear a sample';

  @override
  String get voiceSample => 'Hello. Press the big button and speak to me.';

  @override
  String noVoice(String language) {
    return 'This phone has no $language voice, so replies may be read in another language. Install it in the phone\'s Settings, under Text-to-speech.';
  }

  @override
  String get permissionsHeading => 'Permissions';

  @override
  String get micPermission => 'Microphone, to listen';

  @override
  String get phonePermission => 'Phone, to call straight away';

  @override
  String get phonePermissionDetail =>
      'Without it, the dialer opens and your parent presses the green button.';

  @override
  String get allowed => 'Allowed';

  @override
  String get allow => 'Allow';

  @override
  String get done => 'Done';

  @override
  String get errorGeneric => 'Something went wrong.';

  @override
  String get retry => 'Try again';

  @override
  String get newContact => 'New person';

  @override
  String editContact(String name) {
    return 'Edit $name';
  }

  @override
  String get nameLabel => 'Name shown under the photo';

  @override
  String get phoneLabel => 'Phone number';

  @override
  String get nameRequired => 'Enter a name';

  @override
  String get phoneRequired => 'Enter a phone number';

  @override
  String get takePhoto => 'Take photo';

  @override
  String get choosePhoto => 'Choose photo';

  @override
  String get removePhoto => 'Remove photo';

  @override
  String photoOf(String name) {
    return 'Photo of $name';
  }

  @override
  String get nicknamesHeading => 'Other names your parent uses';

  @override
  String get nicknamesHint =>
      'For example “pedda abbayi”, “బాబు” or “बेटा”. Tap Say it and say the name the way your parent says it, so the phone learns how it hears it.';

  @override
  String get nicknameField => 'Type a name';

  @override
  String get addNickname => 'Add';

  @override
  String get sayIt => 'Say it';

  @override
  String heardNickname(String text) {
    return 'Heard “$text”. Added.';
  }

  @override
  String get heardNicknameNothing => 'Didn\'t catch that. Try again.';

  @override
  String removeNickname(String name) {
    return 'Remove $name';
  }

  @override
  String get forHelpTitle => 'Call for Help';

  @override
  String get forHelpDetail => 'The red Help button calls this person.';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String deleteConfirm(String name) {
    return 'Delete $name?';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get welcomeBody =>
      'A phone helper your parent can talk to. Press one big button and speak: call family, ask the time or the day, turn on the light, or ask for help.';

  @override
  String get chooseLanguage => 'Choose a language';

  @override
  String get privacyNote =>
      'Everything stays on this phone. No account, no ads, no tracking.';

  @override
  String get continueButton => 'Continue';
}

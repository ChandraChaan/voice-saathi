import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_te.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('te'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Voice Saathi'**
  String get appTitle;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageTelugu.
  ///
  /// In en, this message translates to:
  /// **'తెలుగు'**
  String get languageTelugu;

  /// No description provided for @languageHindi.
  ///
  /// In en, this message translates to:
  /// **'हिन्दी'**
  String get languageHindi;

  /// No description provided for @speakButton.
  ///
  /// In en, this message translates to:
  /// **'Press and speak'**
  String get speakButton;

  /// No description provided for @listening.
  ///
  /// In en, this message translates to:
  /// **'Listening…'**
  String get listening;

  /// No description provided for @tapToStop.
  ///
  /// In en, this message translates to:
  /// **'Press again to stop'**
  String get tapToStop;

  /// No description provided for @thinking.
  ///
  /// In en, this message translates to:
  /// **'One moment…'**
  String get thinking;

  /// No description provided for @youSaid.
  ///
  /// In en, this message translates to:
  /// **'You said: “{text}”'**
  String youSaid(String text);

  /// No description provided for @familyHeading.
  ///
  /// In en, this message translates to:
  /// **'Tap a photo to call'**
  String get familyHeading;

  /// No description provided for @helpButton.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get helpButton;

  /// No description provided for @helpButtonHint.
  ///
  /// In en, this message translates to:
  /// **'Calls family for help'**
  String get helpButtonHint;

  /// No description provided for @familySetup.
  ///
  /// In en, this message translates to:
  /// **'Family setup'**
  String get familySetup;

  /// No description provided for @holdToOpen.
  ///
  /// In en, this message translates to:
  /// **'Press and hold to open'**
  String get holdToOpen;

  /// No description provided for @noContactsYet.
  ///
  /// In en, this message translates to:
  /// **'No family numbers yet. Ask your family to open Family setup.'**
  String get noContactsYet;

  /// No description provided for @callName.
  ///
  /// In en, this message translates to:
  /// **'Call {name}'**
  String callName(String name);

  /// No description provided for @helpNextTitle.
  ///
  /// In en, this message translates to:
  /// **'Did {name} answer?'**
  String helpNextTitle(String name);

  /// No description provided for @helpFine.
  ///
  /// In en, this message translates to:
  /// **'Yes, I\'m fine'**
  String get helpFine;

  /// No description provided for @partMorning.
  ///
  /// In en, this message translates to:
  /// **'in the morning'**
  String get partMorning;

  /// No description provided for @partAfternoon.
  ///
  /// In en, this message translates to:
  /// **'in the afternoon'**
  String get partAfternoon;

  /// No description provided for @partEvening.
  ///
  /// In en, this message translates to:
  /// **'in the evening'**
  String get partEvening;

  /// No description provided for @partNight.
  ///
  /// In en, this message translates to:
  /// **'at night'**
  String get partNight;

  /// No description provided for @sayCalling.
  ///
  /// In en, this message translates to:
  /// **'Calling {name}.'**
  String sayCalling(String name);

  /// No description provided for @sayDialer.
  ///
  /// In en, this message translates to:
  /// **'Press the green button to call {name}.'**
  String sayDialer(String name);

  /// No description provided for @sayCallFailed.
  ///
  /// In en, this message translates to:
  /// **'I could not call {name}. Please try again.'**
  String sayCallFailed(String name);

  /// No description provided for @sayCallingForHelp.
  ///
  /// In en, this message translates to:
  /// **'Calling {name} for help.'**
  String sayCallingForHelp(String name);

  /// No description provided for @sayHelpNext.
  ///
  /// In en, this message translates to:
  /// **'If {name} did not answer, press the red Help button to call {next}.'**
  String sayHelpNext(String name, String next);

  /// No description provided for @sayNoHelpContacts.
  ///
  /// In en, this message translates to:
  /// **'No one is set up for Help yet. Please ask your family to set it up.'**
  String get sayNoHelpContacts;

  /// No description provided for @sayWhom.
  ///
  /// In en, this message translates to:
  /// **'Whom should I call? Say the name, or tap a photo.'**
  String get sayWhom;

  /// No description provided for @sayTime.
  ///
  /// In en, this message translates to:
  /// **'It is {clock} {part}.'**
  String sayTime(String clock, String part);

  /// No description provided for @sayDate.
  ///
  /// In en, this message translates to:
  /// **'Today is {weekday}, {date}.'**
  String sayDate(String weekday, String date);

  /// No description provided for @sayBattery.
  ///
  /// In en, this message translates to:
  /// **'The battery is at {percent} percent.'**
  String sayBattery(int percent);

  /// No description provided for @sayCharging.
  ///
  /// In en, this message translates to:
  /// **'It is charging.'**
  String get sayCharging;

  /// No description provided for @sayChargeSoon.
  ///
  /// In en, this message translates to:
  /// **'Please put the phone on charge.'**
  String get sayChargeSoon;

  /// No description provided for @sayBatteryUnknown.
  ///
  /// In en, this message translates to:
  /// **'I could not read the battery.'**
  String get sayBatteryUnknown;

  /// No description provided for @sayTorchOn.
  ///
  /// In en, this message translates to:
  /// **'The light is on.'**
  String get sayTorchOn;

  /// No description provided for @sayTorchOff.
  ///
  /// In en, this message translates to:
  /// **'The light is off.'**
  String get sayTorchOff;

  /// No description provided for @sayNoTorch.
  ///
  /// In en, this message translates to:
  /// **'This phone has no light I can turn on.'**
  String get sayNoTorch;

  /// No description provided for @sayNotUnderstood.
  ///
  /// In en, this message translates to:
  /// **'Sorry, I did not understand. Press the button and say it again, or tap a photo to call.'**
  String get sayNotUnderstood;

  /// No description provided for @sayHeardNothing.
  ///
  /// In en, this message translates to:
  /// **'I did not hear anything. Press the button and speak.'**
  String get sayHeardNothing;

  /// No description provided for @sayVoiceNotReady.
  ///
  /// In en, this message translates to:
  /// **'Listening is not ready on this phone yet. Please ask your family to open Family setup. You can still tap a photo to call.'**
  String get sayVoiceNotReady;

  /// No description provided for @sayNoInternet.
  ///
  /// In en, this message translates to:
  /// **'I need the internet to understand you on this phone. Please try again, or tap a photo to call.'**
  String get sayNoInternet;

  /// No description provided for @sayMicDenied.
  ///
  /// In en, this message translates to:
  /// **'I need the microphone to listen. Please ask your family to allow it in Family setup.'**
  String get sayMicDenied;

  /// No description provided for @sayTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please press the button again.'**
  String get sayTryAgain;

  /// No description provided for @setupIntro.
  ///
  /// In en, this message translates to:
  /// **'Set this up once for your parent. Add the people they call most. The red Help button calls the people marked Help, from the top of the list.'**
  String get setupIntro;

  /// No description provided for @languageHeading.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageHeading;

  /// No description provided for @familyMembers.
  ///
  /// In en, this message translates to:
  /// **'Family members'**
  String get familyMembers;

  /// No description provided for @addContact.
  ///
  /// In en, this message translates to:
  /// **'Add a person'**
  String get addContact;

  /// No description provided for @reorderHint.
  ///
  /// In en, this message translates to:
  /// **'Drag the handle on the right to change the order.'**
  String get reorderHint;

  /// No description provided for @speechHeading.
  ///
  /// In en, this message translates to:
  /// **'Listening'**
  String get speechHeading;

  /// No description provided for @speechOffline.
  ///
  /// In en, this message translates to:
  /// **'{language} is understood on this phone, without internet. Nothing your parent says leaves the phone.'**
  String speechOffline(String language);

  /// No description provided for @speechDownloading.
  ///
  /// In en, this message translates to:
  /// **'Google is downloading {language} for offline use. This can take a few minutes on Wi-Fi.'**
  String speechDownloading(String language);

  /// No description provided for @speechDownloadable.
  ///
  /// In en, this message translates to:
  /// **'{language} can be understood without internet after a one-time download from Google.'**
  String speechDownloadable(String language);

  /// No description provided for @speechDownload.
  ///
  /// In en, this message translates to:
  /// **'Download {language}'**
  String speechDownload(String language);

  /// No description provided for @speechDownloadStarted.
  ///
  /// In en, this message translates to:
  /// **'Follow the phone\'s prompt to download. Keep the phone on Wi-Fi for a few minutes.'**
  String get speechDownloadStarted;

  /// No description provided for @speechDownloadFailed.
  ///
  /// In en, this message translates to:
  /// **'This phone can\'t download it. Turn on online listening below instead.'**
  String get speechDownloadFailed;

  /// No description provided for @speechOnlineOnly.
  ///
  /// In en, this message translates to:
  /// **'This phone can\'t understand {language} without internet.'**
  String speechOnlineOnly(String language);

  /// No description provided for @speechUnknown.
  ///
  /// In en, this message translates to:
  /// **'This phone understands speech on its own, but can\'t tell whether {language} is ready. Try the big button.'**
  String speechUnknown(String language);

  /// No description provided for @speechNone.
  ///
  /// In en, this message translates to:
  /// **'This phone has no speech recognition. Install or update the Google app, or use the photos to call.'**
  String get speechNone;

  /// No description provided for @allowOnline.
  ///
  /// In en, this message translates to:
  /// **'Allow online listening'**
  String get allowOnline;

  /// No description provided for @allowOnlineDetail.
  ///
  /// In en, this message translates to:
  /// **'Uses the phone\'s Google speech service, which sends what your parent says to Google to turn it into text. Only used when the phone can\'t do it alone.'**
  String get allowOnlineDetail;

  /// No description provided for @voiceHeading.
  ///
  /// In en, this message translates to:
  /// **'Voice'**
  String get voiceHeading;

  /// No description provided for @hearSample.
  ///
  /// In en, this message translates to:
  /// **'Hear a sample'**
  String get hearSample;

  /// No description provided for @voiceSample.
  ///
  /// In en, this message translates to:
  /// **'Hello. Press the big button and speak to me.'**
  String get voiceSample;

  /// No description provided for @noVoice.
  ///
  /// In en, this message translates to:
  /// **'This phone has no {language} voice, so replies may be read in another language. Install it in the phone\'s Settings, under Text-to-speech.'**
  String noVoice(String language);

  /// No description provided for @permissionsHeading.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get permissionsHeading;

  /// No description provided for @micPermission.
  ///
  /// In en, this message translates to:
  /// **'Microphone, to listen'**
  String get micPermission;

  /// No description provided for @phonePermission.
  ///
  /// In en, this message translates to:
  /// **'Phone, to call straight away'**
  String get phonePermission;

  /// No description provided for @phonePermissionDetail.
  ///
  /// In en, this message translates to:
  /// **'Without it, the dialer opens and your parent presses the green button.'**
  String get phonePermissionDetail;

  /// No description provided for @allowed.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get allowed;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get errorGeneric;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @newContact.
  ///
  /// In en, this message translates to:
  /// **'New person'**
  String get newContact;

  /// No description provided for @editContact.
  ///
  /// In en, this message translates to:
  /// **'Edit {name}'**
  String editContact(String name);

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name shown under the photo'**
  String get nameLabel;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneLabel;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter a name'**
  String get nameRequired;

  /// No description provided for @phoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter a phone number'**
  String get phoneRequired;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take photo'**
  String get takePhoto;

  /// No description provided for @choosePhoto.
  ///
  /// In en, this message translates to:
  /// **'Choose photo'**
  String get choosePhoto;

  /// No description provided for @removePhoto.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get removePhoto;

  /// No description provided for @photoOf.
  ///
  /// In en, this message translates to:
  /// **'Photo of {name}'**
  String photoOf(String name);

  /// No description provided for @nicknamesHeading.
  ///
  /// In en, this message translates to:
  /// **'Other names your parent uses'**
  String get nicknamesHeading;

  /// No description provided for @nicknamesHint.
  ///
  /// In en, this message translates to:
  /// **'For example “pedda abbayi”, “బాబు” or “बेटा”. Tap Say it and say the name the way your parent says it, so the phone learns how it hears it.'**
  String get nicknamesHint;

  /// No description provided for @nicknameField.
  ///
  /// In en, this message translates to:
  /// **'Type a name'**
  String get nicknameField;

  /// No description provided for @addNickname.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addNickname;

  /// No description provided for @sayIt.
  ///
  /// In en, this message translates to:
  /// **'Say it'**
  String get sayIt;

  /// No description provided for @heardNickname.
  ///
  /// In en, this message translates to:
  /// **'Heard “{text}”. Added.'**
  String heardNickname(String text);

  /// No description provided for @heardNicknameNothing.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t catch that. Try again.'**
  String get heardNicknameNothing;

  /// No description provided for @removeNickname.
  ///
  /// In en, this message translates to:
  /// **'Remove {name}'**
  String removeNickname(String name);

  /// No description provided for @forHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Call for Help'**
  String get forHelpTitle;

  /// No description provided for @forHelpDetail.
  ///
  /// In en, this message translates to:
  /// **'The red Help button calls this person.'**
  String get forHelpDetail;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete {name}?'**
  String deleteConfirm(String name);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @welcomeBody.
  ///
  /// In en, this message translates to:
  /// **'A phone helper your parent can talk to. Press one big button and speak: call family, ask the time or the day, turn on the light, or ask for help.'**
  String get welcomeBody;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose a language'**
  String get chooseLanguage;

  /// No description provided for @privacyNote.
  ///
  /// In en, this message translates to:
  /// **'Everything stays on this phone. No account, no ads, no tracking.'**
  String get privacyNote;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi', 'te'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'te':
      return AppLocalizationsTe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

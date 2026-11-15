// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'వాయిస్ సాథీ';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageTelugu => 'తెలుగు';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get speakButton => 'నొక్కి మాట్లాడండి';

  @override
  String get listening => 'వింటున్నాను…';

  @override
  String get tapToStop => 'ఆపడానికి మళ్ళీ నొక్కండి';

  @override
  String get thinking => 'ఒక్క నిమిషం…';

  @override
  String youSaid(String text) {
    return 'మీరు అన్నది: “$text”';
  }

  @override
  String get familyHeading => 'కాల్ చేయడానికి ఫోటో నొక్కండి';

  @override
  String get helpButton => 'సహాయం';

  @override
  String get helpButtonHint => 'సహాయం కోసం కుటుంబానికి కాల్ చేస్తుంది';

  @override
  String get familySetup => 'కుటుంబ సెటప్';

  @override
  String get holdToOpen => 'తెరవడానికి నొక్కి పట్టుకోండి';

  @override
  String get noContactsYet =>
      'ఇంకా కుటుంబ నంబర్లు లేవు. కుటుంబ సెటప్ తెరవమని మీ వాళ్ళని అడగండి.';

  @override
  String callName(String name) {
    return '$nameకి కాల్ చేయండి';
  }

  @override
  String helpNextTitle(String name) {
    return '$name ఫోన్ ఎత్తారా?';
  }

  @override
  String get helpFine => 'అవును, బాగానే ఉన్నాను';

  @override
  String get partMorning => 'ఉదయం';

  @override
  String get partAfternoon => 'మధ్యాహ్నం';

  @override
  String get partEvening => 'సాయంత్రం';

  @override
  String get partNight => 'రాత్రి';

  @override
  String sayCalling(String name) {
    return '$nameకి కాల్ చేస్తున్నాను.';
  }

  @override
  String sayDialer(String name) {
    return '$nameకి కాల్ చేయడానికి ఆకుపచ్చ బటన్ నొక్కండి.';
  }

  @override
  String sayCallFailed(String name) {
    return '$nameకి కాల్ చేయలేకపోయాను. దయచేసి మళ్ళీ ప్రయత్నించండి.';
  }

  @override
  String sayCallingForHelp(String name) {
    return 'సహాయం కోసం $nameకి కాల్ చేస్తున్నాను.';
  }

  @override
  String sayHelpNext(String name, String next) {
    return '$name ఫోన్ ఎత్తకపోతే, $nextకి కాల్ చేయడానికి ఎరుపు సహాయం బటన్ నొక్కండి.';
  }

  @override
  String get sayNoHelpContacts =>
      'సహాయం కోసం ఇంకా ఎవరినీ పెట్టలేదు. దయచేసి మీ కుటుంబాన్ని సెట్ చేయమని అడగండి.';

  @override
  String get sayWhom =>
      'ఎవరికి కాల్ చేయాలి? పేరు చెప్పండి, లేదా ఫోటో నొక్కండి.';

  @override
  String sayTime(String clock, String part) {
    return 'ఇప్పుడు సమయం $part $clock.';
  }

  @override
  String sayDate(String weekday, String date) {
    return 'ఈరోజు $weekday, $date.';
  }

  @override
  String sayBattery(int percent) {
    return 'బ్యాటరీ $percent శాతం ఉంది.';
  }

  @override
  String get sayCharging => 'ఛార్జ్ అవుతోంది.';

  @override
  String get sayChargeSoon => 'దయచేసి ఫోన్‌ను ఛార్జింగ్‌లో పెట్టండి.';

  @override
  String get sayBatteryUnknown => 'బ్యాటరీ ఎంత ఉందో చూడలేకపోయాను.';

  @override
  String get sayTorchOn => 'లైట్ వేశాను.';

  @override
  String get sayTorchOff => 'లైట్ ఆపేశాను.';

  @override
  String get sayNoTorch => 'ఈ ఫోన్‌లో నేను వేయగల లైట్ లేదు.';

  @override
  String get sayNotUnderstood =>
      'క్షమించండి, అర్థం కాలేదు. బటన్ నొక్కి మళ్ళీ చెప్పండి, లేదా కాల్ చేయడానికి ఫోటో నొక్కండి.';

  @override
  String get sayHeardNothing =>
      'నాకు ఏమీ వినిపించలేదు. బటన్ నొక్కి మాట్లాడండి.';

  @override
  String get sayVoiceNotReady =>
      'ఈ ఫోన్‌లో వినడం ఇంకా సిద్ధంగా లేదు. కుటుంబ సెటప్ తెరవమని మీ వాళ్ళని అడగండి. ఫోటో నొక్కి కాల్ చేయవచ్చు.';

  @override
  String get sayNoInternet =>
      'ఈ ఫోన్‌లో మీ మాట అర్థం చేసుకోవడానికి ఇంటర్నెట్ కావాలి. మళ్ళీ ప్రయత్నించండి, లేదా ఫోటో నొక్కి కాల్ చేయండి.';

  @override
  String get sayMicDenied =>
      'వినడానికి మైక్రోఫోన్ అనుమతి కావాలి. కుటుంబ సెటప్‌లో అనుమతించమని మీ వాళ్ళని అడగండి.';

  @override
  String get sayTryAgain => 'ఏదో పొరపాటు జరిగింది. దయచేసి మళ్ళీ బటన్ నొక్కండి.';

  @override
  String get setupIntro =>
      'మీ అమ్మానాన్నల కోసం ఒక్కసారి సెట్ చేయండి. వాళ్ళు ఎక్కువగా కాల్ చేసే వాళ్ళను చేర్చండి. ఎరుపు సహాయం బటన్, సహాయం అని గుర్తు పెట్టిన వాళ్ళకు జాబితాలో పై నుండి కాల్ చేస్తుంది.';

  @override
  String get languageHeading => 'భాష';

  @override
  String get familyMembers => 'కుటుంబ సభ్యులు';

  @override
  String get addContact => 'వ్యక్తిని చేర్చండి';

  @override
  String get reorderHint =>
      'క్రమం మార్చడానికి కుడి వైపు ఉన్న గీతలను పట్టుకుని లాగండి.';

  @override
  String get speechHeading => 'వినడం';

  @override
  String speechOffline(String language) {
    return 'ఈ ఫోన్‌లో ఇంటర్నెట్ లేకుండానే $language అర్థమవుతుంది. మీ అమ్మానాన్నలు అన్నది ఏదీ ఫోన్ దాటి వెళ్ళదు.';
  }

  @override
  String speechDownloading(String language) {
    return 'Google ఆఫ్‌లైన్ కోసం $language డౌన్‌లోడ్ చేస్తోంది. Wi-Fi లో కొన్ని నిమిషాలు పట్టవచ్చు.';
  }

  @override
  String speechDownloadable(String language) {
    return 'Google నుండి ఒక్కసారి డౌన్‌లోడ్ చేస్తే, ఇంటర్నెట్ లేకుండా $language అర్థమవుతుంది.';
  }

  @override
  String speechDownload(String language) {
    return '$language డౌన్‌లోడ్ చేయండి';
  }

  @override
  String get speechDownloadStarted =>
      'డౌన్‌లోడ్ కోసం ఫోన్ అడిగేది అనుసరించండి. కొన్ని నిమిషాలు ఫోన్‌ను Wi-Fi లో ఉంచండి.';

  @override
  String get speechDownloadFailed =>
      'ఈ ఫోన్ డౌన్‌లోడ్ చేయలేదు. బదులుగా కింద ఆన్‌లైన్ వినడం ఆన్ చేయండి.';

  @override
  String speechOnlineOnly(String language) {
    return 'ఈ ఫోన్ ఇంటర్నెట్ లేకుండా $language అర్థం చేసుకోలేదు.';
  }

  @override
  String speechUnknown(String language) {
    return 'ఈ ఫోన్ సొంతంగా మాటలు అర్థం చేసుకుంటుంది, కానీ $language సిద్ధంగా ఉందో లేదో చెప్పలేదు. పెద్ద బటన్‌తో ప్రయత్నించండి.';
  }

  @override
  String get speechNone =>
      'ఈ ఫోన్‌లో మాటలు గుర్తించే సౌకర్యం లేదు. Google యాప్ ఇన్‌స్టాల్ లేదా అప్‌డేట్ చేయండి, లేదా ఫోటోలతో కాల్ చేయండి.';

  @override
  String get allowOnline => 'ఆన్‌లైన్ వినడం అనుమతించండి';

  @override
  String get allowOnlineDetail =>
      'ఫోన్‌లోని Google మాటల సేవను వాడుతుంది. మీ అమ్మానాన్నలు అన్నది అక్షరాలుగా మార్చడానికి Google కి పంపుతుంది. ఫోన్ సొంతంగా చేయలేనప్పుడు మాత్రమే వాడుతుంది.';

  @override
  String get voiceHeading => 'గొంతు';

  @override
  String get hearSample => 'నమూనా వినండి';

  @override
  String get voiceSample => 'నమస్కారం. పెద్ద బటన్ నొక్కి నాతో మాట్లాడండి.';

  @override
  String noVoice(String language) {
    return 'ఈ ఫోన్‌లో $language గొంతు లేదు, కాబట్టి జవాబులు వేరే భాషలో చదవవచ్చు. ఫోన్ సెట్టింగ్‌లలో Text-to-speech కింద ఇన్‌స్టాల్ చేయండి.';
  }

  @override
  String get permissionsHeading => 'అనుమతులు';

  @override
  String get micPermission => 'మైక్రోఫోన్, వినడానికి';

  @override
  String get phonePermission => 'ఫోన్, వెంటనే కాల్ చేయడానికి';

  @override
  String get phonePermissionDetail =>
      'ఇది లేకపోతే డయలర్ తెరుచుకుంటుంది, మీ అమ్మానాన్నలు ఆకుపచ్చ బటన్ నొక్కాలి.';

  @override
  String get allowed => 'అనుమతి ఉంది';

  @override
  String get allow => 'అనుమతించండి';

  @override
  String get done => 'పూర్తయింది';

  @override
  String get errorGeneric => 'ఏదో పొరపాటు జరిగింది.';

  @override
  String get retry => 'మళ్ళీ ప్రయత్నించండి';

  @override
  String get newContact => 'కొత్త వ్యక్తి';

  @override
  String editContact(String name) {
    return '$name మార్చండి';
  }

  @override
  String get nameLabel => 'ఫోటో కింద చూపించే పేరు';

  @override
  String get phoneLabel => 'ఫోన్ నంబర్';

  @override
  String get nameRequired => 'పేరు ఇవ్వండి';

  @override
  String get phoneRequired => 'ఫోన్ నంబర్ ఇవ్వండి';

  @override
  String get takePhoto => 'ఫోటో తీయండి';

  @override
  String get choosePhoto => 'ఫోటో ఎంచుకోండి';

  @override
  String get removePhoto => 'ఫోటో తీసేయండి';

  @override
  String photoOf(String name) {
    return '$name ఫోటో';
  }

  @override
  String get nicknamesHeading => 'మీ అమ్మానాన్నలు పిలిచే ఇతర పేర్లు';

  @override
  String get nicknamesHint =>
      'ఉదాహరణకు “పెద్ద అబ్బాయి”, “బాబు” లేదా “बेटा”. చెప్పండి నొక్కి, మీ అమ్మానాన్నలు పిలిచే లాగే పేరు చెప్పండి. అప్పుడు ఫోన్ ఆ పేరు ఎలా వింటుందో నేర్చుకుంటుంది.';

  @override
  String get nicknameField => 'పేరు టైప్ చేయండి';

  @override
  String get addNickname => 'చేర్చు';

  @override
  String get sayIt => 'చెప్పండి';

  @override
  String heardNickname(String text) {
    return '“$text” విన్నాను. చేర్చాను.';
  }

  @override
  String get heardNicknameNothing => 'వినిపించలేదు. మళ్ళీ ప్రయత్నించండి.';

  @override
  String removeNickname(String name) {
    return '$name తీసేయండి';
  }

  @override
  String get forHelpTitle => 'సహాయం కోసం కాల్ చేయాలి';

  @override
  String get forHelpDetail => 'ఎరుపు సహాయం బటన్ ఈ వ్యక్తికి కాల్ చేస్తుంది.';

  @override
  String get save => 'సేవ్ చేయండి';

  @override
  String get delete => 'తొలగించండి';

  @override
  String deleteConfirm(String name) {
    return '$nameని తొలగించాలా?';
  }

  @override
  String get cancel => 'రద్దు';

  @override
  String get welcomeBody =>
      'మీ అమ్మానాన్నలు మాట్లాడగల ఫోన్ సహాయకుడు. ఒక పెద్ద బటన్ నొక్కి మాట్లాడితే చాలు: కుటుంబానికి కాల్, సమయం లేదా రోజు అడగడం, లైట్ వేయడం, లేదా సహాయం అడగడం.';

  @override
  String get chooseLanguage => 'భాష ఎంచుకోండి';

  @override
  String get privacyNote =>
      'అన్నీ ఈ ఫోన్‌లోనే ఉంటాయి. ఖాతా లేదు, ప్రకటనలు లేవు, ట్రాకింగ్ లేదు.';

  @override
  String get continueButton => 'కొనసాగించండి';
}

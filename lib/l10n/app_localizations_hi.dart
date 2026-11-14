// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'वॉयस साथी';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageTelugu => 'తెలుగు';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get speakButton => 'दबाकर बोलिए';

  @override
  String get listening => 'सुन रहे हैं…';

  @override
  String get tapToStop => 'रोकने के लिए फिर दबाइए';

  @override
  String get thinking => 'एक पल…';

  @override
  String youSaid(String text) {
    return 'आपने कहा: “$text”';
  }

  @override
  String get familyHeading => 'कॉल करने के लिए फ़ोटो दबाइए';

  @override
  String get helpButton => 'मदद';

  @override
  String get helpButtonHint => 'मदद के लिए परिवार को कॉल करता है';

  @override
  String get familySetup => 'परिवार सेटअप';

  @override
  String get holdToOpen => 'खोलने के लिए दबाकर रखिए';

  @override
  String get noContactsYet =>
      'अभी परिवार का कोई नंबर नहीं है। परिवार से सेटअप खोलने को कहिए।';

  @override
  String callName(String name) {
    return '$name को कॉल करें';
  }

  @override
  String helpNextTitle(String name) {
    return 'क्या $name ने फ़ोन उठाया?';
  }

  @override
  String get helpFine => 'हाँ, मैं ठीक हूँ';

  @override
  String get partMorning => 'सुबह';

  @override
  String get partAfternoon => 'दोपहर';

  @override
  String get partEvening => 'शाम';

  @override
  String get partNight => 'रात';

  @override
  String sayCalling(String name) {
    return '$name को फ़ोन लगा रहे हैं।';
  }

  @override
  String sayDialer(String name) {
    return '$name को कॉल करने के लिए हरा बटन दबाइए।';
  }

  @override
  String sayCallFailed(String name) {
    return '$name को फ़ोन नहीं लग पाया। कृपया फिर से कोशिश कीजिए।';
  }

  @override
  String sayCallingForHelp(String name) {
    return 'मदद के लिए $name को फ़ोन लगा रहे हैं।';
  }

  @override
  String sayHelpNext(String name, String next) {
    return 'अगर $name ने फ़ोन नहीं उठाया, तो $next को कॉल करने के लिए लाल मदद बटन दबाइए।';
  }

  @override
  String get sayNoHelpContacts =>
      'मदद के लिए अभी कोई नंबर नहीं रखा है। कृपया परिवार से सेट करने को कहिए।';

  @override
  String get sayWhom => 'किसे फ़ोन करें? नाम बोलिए, या फ़ोटो दबाइए।';

  @override
  String sayTime(String clock, String part) {
    return 'अभी $part के $clock बजे हैं।';
  }

  @override
  String sayDate(String weekday, String date) {
    return 'आज $weekday है, $date।';
  }

  @override
  String sayBattery(int percent) {
    return 'बैटरी $percent प्रतिशत है।';
  }

  @override
  String get sayCharging => 'चार्ज हो रही है।';

  @override
  String get sayChargeSoon => 'कृपया फ़ोन को चार्ज पर लगाइए।';

  @override
  String get sayBatteryUnknown => 'बैटरी नहीं देख पाए।';

  @override
  String get sayTorchOn => 'लाइट जला दी है।';

  @override
  String get sayTorchOff => 'लाइट बंद कर दी है।';

  @override
  String get sayNoTorch => 'इस फ़ोन में ऐसी लाइट नहीं है जिसे मैं जला सकूँ।';

  @override
  String get sayNotUnderstood =>
      'माफ़ कीजिए, समझ नहीं आया। बटन दबाकर फिर से बोलिए, या कॉल करने के लिए फ़ोटो दबाइए।';

  @override
  String get sayHeardNothing => 'कुछ सुनाई नहीं दिया। बटन दबाकर बोलिए।';

  @override
  String get sayVoiceNotReady =>
      'इस फ़ोन पर सुनना अभी तैयार नहीं है। परिवार से सेटअप खोलने को कहिए। फ़ोटो दबाकर कॉल कर सकते हैं।';

  @override
  String get sayNoInternet =>
      'इस फ़ोन पर आपकी बात समझने के लिए इंटरनेट चाहिए। फिर से कोशिश कीजिए, या फ़ोटो दबाकर कॉल कीजिए।';

  @override
  String get sayMicDenied =>
      'सुनने के लिए माइक्रोफ़ोन की अनुमति चाहिए। परिवार से सेटअप में अनुमति देने को कहिए।';

  @override
  String get sayTryAgain => 'कुछ गड़बड़ हो गई। कृपया फिर से बटन दबाइए।';

  @override
  String get setupIntro =>
      'अपने माता-पिता के लिए इसे एक बार सेट कीजिए। जिन्हें वे सबसे ज़्यादा फ़ोन करते हैं, उन्हें जोड़िए। लाल मदद बटन उन लोगों को कॉल करता है जिन पर मदद लगा है, सूची में ऊपर से।';

  @override
  String get languageHeading => 'भाषा';

  @override
  String get familyMembers => 'परिवार के लोग';

  @override
  String get addContact => 'व्यक्ति जोड़ें';

  @override
  String get reorderHint =>
      'क्रम बदलने के लिए दाईं ओर की लकीरों को पकड़कर खींचिए।';

  @override
  String get speechHeading => 'सुनना';

  @override
  String speechOffline(String language) {
    return 'इस फ़ोन पर बिना इंटरनेट के $language समझ आती है। माता-पिता जो भी बोलें, वह फ़ोन से बाहर नहीं जाता।';
  }

  @override
  String speechDownloading(String language) {
    return 'Google ऑफ़लाइन इस्तेमाल के लिए $language डाउनलोड कर रहा है। Wi-Fi पर कुछ मिनट लग सकते हैं।';
  }

  @override
  String speechDownloadable(String language) {
    return 'Google से एक बार डाउनलोड करने के बाद, बिना इंटरनेट के $language समझ आएगी।';
  }

  @override
  String speechDownload(String language) {
    return '$language डाउनलोड करें';
  }

  @override
  String get speechDownloadStarted =>
      'डाउनलोड के लिए फ़ोन जो पूछे, वह कीजिए। कुछ मिनट फ़ोन को Wi-Fi पर रखिए।';

  @override
  String get speechDownloadFailed =>
      'यह फ़ोन इसे डाउनलोड नहीं कर सकता। इसके बजाय नीचे ऑनलाइन सुनना चालू कीजिए।';

  @override
  String speechOnlineOnly(String language) {
    return 'यह फ़ोन बिना इंटरनेट के $language नहीं समझ सकता।';
  }

  @override
  String speechUnknown(String language) {
    return 'यह फ़ोन खुद बोली समझता है, पर यह नहीं बताता कि $language तैयार है या नहीं। बड़े बटन से आज़माइए।';
  }

  @override
  String get speechNone =>
      'इस फ़ोन में बोली पहचानने की सुविधा नहीं है। Google ऐप इंस्टॉल या अपडेट कीजिए, या फ़ोटो से कॉल कीजिए।';

  @override
  String get allowOnline => 'ऑनलाइन सुनने की अनुमति दें';

  @override
  String get allowOnlineDetail =>
      'फ़ोन की Google बोली सेवा इस्तेमाल करता है, जो माता-पिता की बात को अक्षरों में बदलने के लिए Google को भेजती है। सिर्फ़ तब, जब फ़ोन खुद न कर सके।';

  @override
  String get voiceHeading => 'आवाज़';

  @override
  String get hearSample => 'नमूना सुनिए';

  @override
  String get voiceSample => 'नमस्ते। बड़ा बटन दबाकर मुझसे बात कीजिए।';

  @override
  String noVoice(String language) {
    return 'इस फ़ोन में $language आवाज़ नहीं है, इसलिए जवाब किसी और भाषा में पढ़े जा सकते हैं। फ़ोन की सेटिंग में Text-to-speech के अंदर इंस्टॉल कीजिए।';
  }

  @override
  String get permissionsHeading => 'अनुमतियाँ';

  @override
  String get micPermission => 'माइक्रोफ़ोन, सुनने के लिए';

  @override
  String get phonePermission => 'फ़ोन, सीधे कॉल करने के लिए';

  @override
  String get phonePermissionDetail =>
      'इसके बिना डायलर खुलेगा और माता-पिता को हरा बटन दबाना होगा।';

  @override
  String get allowed => 'अनुमति है';

  @override
  String get allow => 'अनुमति दें';

  @override
  String get done => 'हो गया';

  @override
  String get errorGeneric => 'कुछ गड़बड़ हो गई।';

  @override
  String get retry => 'फिर से कोशिश करें';

  @override
  String get newContact => 'नया व्यक्ति';

  @override
  String editContact(String name) {
    return '$name बदलें';
  }

  @override
  String get nameLabel => 'फ़ोटो के नीचे दिखने वाला नाम';

  @override
  String get phoneLabel => 'फ़ोन नंबर';

  @override
  String get nameRequired => 'नाम लिखिए';

  @override
  String get phoneRequired => 'फ़ोन नंबर लिखिए';

  @override
  String get takePhoto => 'फ़ोटो खींचें';

  @override
  String get choosePhoto => 'फ़ोटो चुनें';

  @override
  String get removePhoto => 'फ़ोटो हटाएँ';

  @override
  String photoOf(String name) {
    return '$name की फ़ोटो';
  }

  @override
  String get nicknamesHeading => 'माता-पिता जिन दूसरे नामों से बुलाते हैं';

  @override
  String get nicknamesHint =>
      'जैसे “बेटा”, “मुन्ना” या “పెద్ద అబ్బాయి”। बोलिए दबाकर नाम वैसे ही बोलिए जैसे माता-पिता बोलते हैं, ताकि फ़ोन सीख ले कि वह नाम कैसे सुनता है।';

  @override
  String get nicknameField => 'नाम लिखिए';

  @override
  String get addNickname => 'जोड़ें';

  @override
  String get sayIt => 'बोलिए';

  @override
  String heardNickname(String text) {
    return '“$text” सुना। जोड़ दिया।';
  }

  @override
  String get heardNicknameNothing => 'सुनाई नहीं दिया। फिर से कोशिश कीजिए।';

  @override
  String removeNickname(String name) {
    return '$name हटाएँ';
  }

  @override
  String get forHelpTitle => 'मदद के लिए कॉल करें';

  @override
  String get forHelpDetail => 'लाल मदद बटन इस व्यक्ति को कॉल करेगा।';

  @override
  String get save => 'सेव करें';

  @override
  String get delete => 'हटाएँ';

  @override
  String deleteConfirm(String name) {
    return '$name को हटाएँ?';
  }

  @override
  String get cancel => 'रद्द करें';

  @override
  String get welcomeBody =>
      'फ़ोन का एक साथी जिससे माता-पिता बात कर सकते हैं। एक बड़ा बटन दबाकर बोलिए: परिवार को कॉल, समय या दिन पूछना, लाइट जलाना, या मदद माँगना।';

  @override
  String get chooseLanguage => 'भाषा चुनिए';

  @override
  String get privacyNote =>
      'सब कुछ इसी फ़ोन पर रहता है। कोई खाता नहीं, कोई विज्ञापन नहीं, कोई ट्रैकिंग नहीं।';

  @override
  String get continueButton => 'आगे बढ़ें';
}

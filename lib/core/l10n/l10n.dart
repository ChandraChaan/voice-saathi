import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';
import '../language.dart';

export '../../l10n/app_localizations.dart';

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Localisations for code that runs outside the widget tree (spoken replies).
AppLocalizations l10nFor(AppLanguage language) =>
    lookupAppLocalizations(Locale(language.code));

/// Each language's name in its own script, so anyone can find theirs.
String languageName(AppLocalizations l10n, AppLanguage language) =>
    switch (language) {
      AppLanguage.english => l10n.languageEnglish,
      AppLanguage.telugu => l10n.languageTelugu,
      AppLanguage.hindi => l10n.languageHindi,
    };

/// "It is 10:35 in the morning." The clock is 12-hour without AM/PM; the
/// part of the day says which half, as people say it aloud.
String spokenTime(AppLocalizations l10n, DateTime now) {
  final part = switch (now.hour) {
    >= 4 && < 12 => l10n.partMorning,
    >= 12 && < 17 => l10n.partAfternoon,
    >= 17 && < 20 => l10n.partEvening,
    _ => l10n.partNight,
  };
  final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
  final clock = '$hour:${now.minute.toString().padLeft(2, '0')}';
  return l10n.sayTime(clock, part);
}

/// "Today is Sunday, 15 November."
String spokenDate(AppLocalizations l10n, DateTime now) => l10n.sayDate(
  DateFormat.EEEE(l10n.localeName).format(now),
  DateFormat('d MMMM', l10n.localeName).format(now),
);

/// The date line on the display, for example "Sunday, 15 November".
String displayDate(AppLocalizations l10n, DateTime now) =>
    '${DateFormat.EEEE(l10n.localeName).format(now)}, '
    '${DateFormat('d MMMM', l10n.localeName).format(now)}';

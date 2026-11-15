import 'package:flutter/material.dart';

/// The colours of an old push-button home phone: ivory plastic body, cream
/// keys with a darker lower edge, a green-black display, a deep green talk
/// key and a red help key.
@immutable
class PhoneColors extends ThemeExtension<PhoneColors> {
  const PhoneColors({
    required this.body,
    required this.bodyShade,
    required this.onBody,
    required this.onBodyMuted,
    required this.key,
    required this.keyEdge,
    required this.onKey,
    required this.display,
    required this.displayEdge,
    required this.onDisplay,
    required this.onDisplayMuted,
    required this.talk,
    required this.talkEdge,
    required this.onTalk,
    required this.listening,
    required this.help,
    required this.helpEdge,
    required this.onHelp,
  });

  final Color body;
  final Color bodyShade;
  final Color onBody;
  final Color onBodyMuted;
  final Color key;
  final Color keyEdge;
  final Color onKey;
  final Color display;
  final Color displayEdge;
  final Color onDisplay;
  final Color onDisplayMuted;
  final Color talk;
  final Color talkEdge;
  final Color onTalk;
  final Color listening;
  final Color help;
  final Color helpEdge;
  final Color onHelp;

  static PhoneColors of(BuildContext context) =>
      Theme.of(context).extension<PhoneColors>()!;

  @override
  PhoneColors copyWith() => this;

  @override
  PhoneColors lerp(PhoneColors? other, double t) => other ?? this;
}

const _phone = PhoneColors(
  body: Color(0xFFEAE0C8),
  bodyShade: Color(0xFFD6C9AA),
  onBody: Color(0xFF241E14),
  onBodyMuted: Color(0xFF574C38),
  key: Color(0xFFFBF8F0),
  keyEdge: Color(0xFFB4A584),
  onKey: Color(0xFF1F1A12),
  display: Color(0xFF1F2B25),
  displayEdge: Color(0xFF0E1511),
  onDisplay: Color(0xFFDDF2CF),
  onDisplayMuted: Color(0xFFA9C29C),
  talk: Color(0xFF2E5B4E),
  talkEdge: Color(0xFF173329),
  onTalk: Color(0xFFFFFFFF),
  listening: Color(0xFFE59A2F),
  help: Color(0xFFB0261C),
  helpEdge: Color(0xFF6E1610),
  onHelp: Color(0xFFFFFFFF),
);

/// Large type and strong contrast, made for older eyes. Light only: the
/// phone body is meant to look like plastic in daylight.
ThemeData buildAppTheme() {
  final scheme = ColorScheme(
    brightness: Brightness.light,
    primary: _phone.talk,
    onPrimary: _phone.onTalk,
    primaryContainer: const Color(0xFFCFE6DC),
    onPrimaryContainer: const Color(0xFF0B231B),
    secondary: const Color(0xFF6B5418),
    onSecondary: Colors.white,
    secondaryContainer: const Color(0xFFF3E3B5),
    onSecondaryContainer: const Color(0xFF261A00),
    error: _phone.help,
    onError: _phone.onHelp,
    errorContainer: const Color(0xFFFFDAD5),
    onErrorContainer: const Color(0xFF410001),
    surface: const Color(0xFFF8F3E7),
    onSurface: _phone.onBody,
    onSurfaceVariant: _phone.onBodyMuted,
    surfaceContainerLowest: _phone.key,
    surfaceContainerLow: const Color(0xFFF3ECDC),
    surfaceContainer: const Color(0xFFEDE5D2),
    surfaceContainerHigh: _phone.body,
    surfaceContainerHighest: _phone.bodyShade,
    outline: const Color(0xFF7F7259),
    outlineVariant: _phone.bodyShade,
  );
  final base = ThemeData(colorScheme: scheme, useMaterial3: true);
  final text = base.textTheme.apply(
    bodyColor: scheme.onSurface,
    displayColor: scheme.onSurface,
  );
  return base.copyWith(
    scaffoldBackgroundColor: _phone.body,
    extensions: const [_phone],
    textTheme: text.copyWith(
      headlineMedium: text.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      titleLarge: text.titleLarge?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: text.titleMedium?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: text.bodyLarge?.copyWith(fontSize: 19, height: 1.4),
      bodyMedium: text.bodyMedium?.copyWith(fontSize: 17, height: 1.4),
      labelLarge: text.labelLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _phone.body,
      foregroundColor: _phone.onBody,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: text.titleLarge?.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: _phone.onBody,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(64, 56),
        textStyle: text.labelLarge?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(64, 52),
        foregroundColor: _phone.onBody,
        side: BorderSide(color: scheme.outline, width: 1.5),
        textStyle: text.labelLarge?.copyWith(fontSize: 17),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _phone.key,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    ),
    cardTheme: CardThemeData(
      color: _phone.key,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: _phone.bodyShade, width: 1.5),
      ),
    ),
    switchTheme: const SwitchThemeData(
      materialTapTargetSize: MaterialTapTargetSize.padded,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: _phone.display,
      contentTextStyle: text.bodyLarge?.copyWith(color: _phone.onDisplay),
    ),
  );
}

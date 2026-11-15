import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/l10n/l10n.dart';
import '../core/providers.dart';
import '../core/theme/app_theme.dart';
import '../features/assistant/presentation/assistant_controller.dart';
import '../features/assistant/presentation/home_screen.dart';
import '../features/family/presentation/contact_form_screen.dart';
import '../features/settings/presentation/settings_controller.dart';
import '../features/settings/presentation/setup_screen.dart';
import '../features/settings/presentation/welcome_screen.dart';

GoRouter buildRouter(String initialLocation) => GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(path: '/', builder: (_, _) => const HomeScreen()),
    GoRoute(path: '/welcome', builder: (_, _) => const WelcomeScreen()),
    GoRoute(
      path: '/setup',
      builder: (_, _) => const SetupScreen(),
      routes: [
        GoRoute(
          path: 'contact/new',
          builder: (_, _) => const ContactFormScreen(),
        ),
        GoRoute(
          path: 'contact/:id',
          builder: (_, state) =>
              ContactFormScreen(contactId: state.pathParameters['id']),
        ),
      ],
    ),
  ],
);

class VoiceSaathiApp extends ConsumerStatefulWidget {
  const VoiceSaathiApp({required this.initialLocation, super.key});

  final String initialLocation;

  @override
  ConsumerState<VoiceSaathiApp> createState() => _VoiceSaathiAppState();
}

class _VoiceSaathiAppState extends ConsumerState<VoiceSaathiApp>
    with WidgetsBindingObserver {
  late final GoRouter _router = buildRouter(widget.initialLocation);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Permissions, downloads and the clock may have changed meanwhile.
      ref
        ..invalidate(permissionStatusProvider)
        ..invalidate(recognizerStatusProvider)
        ..invalidate(hasVoiceProvider)
        ..invalidate(nowProvider);
      unawaited(ref.read(assistantProvider.notifier).onResumed());
    } else if (state == AppLifecycleState.paused) {
      unawaited(ref.read(speechServiceProvider).stop());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: buildAppTheme(),
      locale: Locale(language.code),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: _router,
    );
  }
}

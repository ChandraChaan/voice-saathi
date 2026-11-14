import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/language.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/phone_key.dart';
import 'settings_controller.dart';

/// First run: the family picks the language, then sets up people.
class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = PhoneColors.of(context);
    final text = Theme.of(context).textTheme;
    final selected = ref.watch(languageProvider);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 32),
          children: [
            Icon(Icons.record_voice_over_rounded, size: 72, color: colors.talk),
            const SizedBox(height: 12),
            Text(
              l10n.appTitle,
              textAlign: TextAlign.center,
              style: text.headlineMedium,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.welcomeBody,
              textAlign: TextAlign.center,
              style: text.bodyLarge,
            ),
            const SizedBox(height: 28),
            Text(
              l10n.chooseLanguage,
              textAlign: TextAlign.center,
              style: text.titleLarge,
            ),
            const SizedBox(height: 14),
            for (final language in AppLanguage.values)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: PhoneKey(
                  color: language == selected ? colors.talk : colors.key,
                  edgeColor: language == selected
                      ? colors.talkEdge
                      : colors.keyEdge,
                  semanticLabel: languageName(l10n, language),
                  onTap: () => unawaited(
                    ref.read(settingsProvider.notifier).setLanguage(language),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (language == selected) ...[
                          Icon(Icons.check_rounded, color: colors.onTalk),
                          const SizedBox(width: 8),
                        ],
                        Flexible(
                          child: Text(
                            languageName(l10n, language),
                            style: text.titleLarge?.copyWith(
                              color: language == selected
                                  ? colors.onTalk
                                  : colors.onKey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              l10n.privacyNote,
              textAlign: TextAlign.center,
              style: text.bodyMedium,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () async {
                await ref
                    .read(settingsProvider.notifier)
                    .finishWelcome(selected);
                if (context.mounted) context.go('/setup');
              },
              child: Text(l10n.continueButton),
            ),
          ],
        ),
      ),
    );
  }
}

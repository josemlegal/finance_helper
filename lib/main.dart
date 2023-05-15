import 'package:finance_helper/core/dependency_injection/locator.dart';
import 'package:finance_helper/core/router/router.dart';
import 'package:finance_helper/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/settings/settings_controller.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
  setupLocator();
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      themeMode: appTheme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'Finance Helper',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}

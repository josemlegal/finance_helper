import 'package:finance_helper/core/dependency_injection/locator.dart';
import 'package:finance_helper/core/dependency_injection/setup_snackbar_ui.dart';
import 'package:finance_helper/core/router/router.dart' as router;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart' as services;
import 'package:finance_helper/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'presentation/settings/controllers/settings_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
  setupLocator();
  setupSnackbarUi();
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp(
      themeMode: appTheme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'Finance Helper',
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      navigatorKey: services.StackedService.navigatorKey,
      initialRoute: router.Router.homeView,
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}

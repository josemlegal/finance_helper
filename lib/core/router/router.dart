import 'package:finance_helper/domain/transactions/models/transaction_model.dart';
import 'package:finance_helper/presentation/views.dart';
import 'package:flutter/material.dart';

class Router {
  static const homeView = '/home-view';
  static const transactionsView = '/transactions-view';
  static const loginView = '/login-view';
  static const onboardingView = '/onboarding-view';
  static const settingsView = '/settings-view';
  static const transactionDetails = '/transaction-detail';
  static const dashboardView = '/dashboard-view';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case transactionsView:
        return MaterialPageRoute(builder: (_) => const TransactionsView());
      case loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case onboardingView:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case settingsView:
        return MaterialPageRoute(builder: (_) => const SettingsView());
      case transactionDetails:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => TransactionDetails(
            transaction: args['transaction'] as Transaction,
          ),
        );
      case dashboardView:
        return MaterialPageRoute(builder: (_) => const DashboardView());

      default:
        return null;
    }
  }
}

import 'package:finance_helper/presentation/login/views/login_view.dart';
import 'package:finance_helper/presentation/onboarding/views/onboarding_view.dart';
import 'package:finance_helper/presentation/transactions/views/transaction_details.dart';
import 'package:finance_helper/presentation/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/transactions-view',
  routes: [
    GoRoute(
      path: '/onboarding-view',
      name: OnboardingView.name,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: '/login-view',
      name: LoginView.name,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: '/dashboard-view',
      name: DashboardView.name,
      builder: (context, state) => const DashboardView(),
    ),
    GoRoute(
      path: '/home-view',
      name: HomeView.name,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/transactions-view',
      name: TransactionsView.name,
      builder: (context, state) => const TransactionsView(),
    ),
    GoRoute(
      path: '/transaction-details',
      name: TransactionDetails.name,
      builder: (context, state) => const TransactionDetails(),
    ),
    GoRoute(
      path: '/settings-view',
      name: SettingsView.name,
      builder: (context, state) => const SettingsView(),
    ),
  ],
);

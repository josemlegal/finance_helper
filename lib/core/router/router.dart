import 'package:finance_helper/presentation/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home-view',
  routes: [
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
      path: '/settings-view',
      name: SettingsView.name,
      builder: (context, state) => const SettingsView(),
    ),
  ],
);

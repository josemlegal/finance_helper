import 'package:finance_helper/presentation/dashboard/views/dashboard_view.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    GoRoute(
      path: '/dashboard',
      name: DashboardView.name,
      builder: (context, state) => const DashboardView(),
    ),
  ],
);

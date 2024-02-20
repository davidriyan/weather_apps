import 'package:go_router/go_router.dart';
import 'package:weather_apps/features/dashboard/presentation/widget/persistence_navbar.dart';
import 'package:weather_apps/framework/routes/pages/error.dart';

part 'routes_name.dart';

final router = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      name: Routes.dashboard,
      builder: (context, state) => PersistenceNavbar(),
    ),
  ],
);

import 'package:auto_route/auto_route.dart';
import 'package:event_returns_mobile/presentation/routes/app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: MainRoute.page,
          path: '/',
        ),
        // AutoRoute(
        //   initial: true,
        //   page: MapRoute.page,
        //   path: '/',
        // ),
      ];

  @override
  late final List<AutoRouteGuard> guards = [];
}

import 'package:auto_route/auto_route.dart';

import '../ui/auth/auth_view.dart';
import '../ui/events_tab/events_view.dart';
import '../ui/home_tab/home_view.dart';
import '../ui/main/main_view.dart';
import '../ui/onboarding/onboarding_view.dart';
import '../ui/profile_tab/profile_view.dart';
import '../ui/splash/splash_view.dart';
import '../ui/venue_tab/venue_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: SplashRoute.page,
        ),
        AutoRoute(
          path: '/auth',
          page: AuthRoute.page,
        ),
        AutoRoute(
          path: '/main',
          page: MainRoute.page,
          children: [
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'events',
              page: EventsRoute.page,
            ),
            AutoRoute(
              path: 'venue',
              page: VenueRoute.page,
            ),
            AutoRoute(
              path: 'profile',
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/onboarding',
          page: OnboardingRoute.page,
        ),
      ];
}

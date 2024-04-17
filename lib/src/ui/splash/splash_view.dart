import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/app_repository.dart';
import '../../routing/app_router.dart';
import '../../services/preferences_service.dart';

@RoutePage()
class SplashView extends ConsumerStatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  Widget build(BuildContext context) {
    ref.listen(appRepositoryProvider, (previous, next) {
      _navigateBasedOnAuthStatus(next.status);
    });

    return const Scaffold(
      body: Center(
        child: Text(
          'Splash View',
        ),
      ),
    );
  }

  _navigateBasedOnAuthStatus(AppStatus authStatus) async {
    final router = context.router;
    if (authStatus == AppStatus.unauthenticated) {
      final isFresh = ref.read(sharedPreferencesProvider).getBool(isFreshKey);
      if (isFresh == null || isFresh == true) {
        router.replace(const OnboardingRoute());
        debugPrint('NAVIGATION: Splash replaced with Onboarding Page');
      } else {
        router.replace(const AuthRoute());
        debugPrint('NAVIGATION: Splash replaced with Auth Page');
      }
    } else if (authStatus == AppStatus.authenticated) {
      router.replace(const MainRoute());
      debugPrint('NAVIGATION: Splash replaced with Main Page');
    }
    // else if (authStatus == AppStatus.authenticatedButNoInternetConnection) {
    //   router.replace(const NoInternetRoute());
    //   debugPrint('NAVIGATION: Splash replaced with No Internet Page');
    // }
  }
}

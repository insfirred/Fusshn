import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../routing/app_router.dart';
import '../../services/preferences_service.dart';

@RoutePage()
class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(preferenceServiceProvider).setBool(isFreshKey, false);
            context.router.replace(const AuthRoute());
          },
          child: const Text('Continue'),
        ),
      ),
    );
  }
}

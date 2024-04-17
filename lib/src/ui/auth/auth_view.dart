import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/app_repository.dart';
import '../../routing/app_router.dart';
import '../../utils/snackbar_utils.dart';
import 'auth_view_model.dart';
import 'components/login_section.dart';
import 'components/register_section.dart';

@RoutePage()
class AuthView extends ConsumerWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      appRepositoryProvider,
      (previous, next) {
        final router = context.router;

        if (next.status == AppStatus.authenticated) {
          router.replace(const MainRoute());
          debugPrint('NAVIGATION: Splash replaced with Main Page');
        }
      },
    );

    final activeScreen = ref.watch(
      authViewModelProvider.select((_) => _.activeScreen),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: activeScreen == AuthViewType.register
              ? const RegisterSection()
              : const LoginSection(),
        ),
      ),
    );
  }
}

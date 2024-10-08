import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/common/dimens.dart';
import 'package:video_player/video_player.dart';

import '../../repositories/app_repository.dart';
import '../../routing/app_router.dart';
import 'auth_view_model.dart';
import 'components/login_section.dart';
import 'components/register_section.dart';

@RoutePage()
class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  ConsumerState<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> {
  // late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset('assets/videos/onboarding.mp4');

    // _controller.addListener(() {
    //   setState(() {});
    // });
    // _controller.setLooping(true);
    // _controller.initialize().then((_) => setState(() {}));
    // _controller.play();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      appRepositoryProvider,
      (previous, next) {
        final router = context.router;

        if (next.status == AppStatus.authenticated) {
          router.replace(const MainRoute());
          debugPrint('NAVIGATION: Splash replaced with Create Prefs Page');
        }
      },
    );

    final activeScreen = ref.watch(
      authViewModelProvider.select((_) => _.activeScreen),
    );

    return Scaffold(
      body: Stack(
        children: [
          // VideoPlayer(_controller),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: authViewHorizontalPadding),
            child: activeScreen == AuthViewType.register
                ? const RegisterSection()
                : const LoginSection(),
          ),
        ],
      ),
    );
  }
}

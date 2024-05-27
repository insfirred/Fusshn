import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../common/dimens.dart';
import '../../routing/app_router.dart';
import '../../services/preferences_service.dart';

@RoutePage()
class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/onboarding.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          VideoPlayer(_controller),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: authViewHorizontalPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Where FOMO meets YOLO daily!',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Dive into the secret society of exclusive events – where the dance floor is an elite runway, and FOMO gets a backstage pass!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(preferenceServiceProvider)
                        .setBool(isFreshKey, false);
                    context.router.replace(const AuthRoute());
                  },
                  child: const Text('Continue'),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

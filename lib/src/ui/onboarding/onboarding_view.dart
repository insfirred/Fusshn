import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/ui/common_widgets/fusshn_btn.dart';
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
  final _pageController = PageController();

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          VideoPlayer(_controller),
          _OnboardingPageView(_pageController),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < onboardingDataList.length; i++) ...[
                      _indicator(ref.read(currentOnboardingIndexProvider) == i,
                          context),
                    ],
                  ],
                ),
                const SizedBox(height: 30),
                ref.read(currentOnboardingIndexProvider) ==
                        onboardingDataList.length - 1
                    ? FusshnBtn(
                        height: 50,
                        label: 'Continue',
                        onTap: () {
                          ref
                              .read(preferenceServiceProvider)
                              .setBool(isFreshKey, false);
                          context.router.replace(const AuthRoute());
                        },
                      )
                    : GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Image.asset(
                          'assets/next_btn_icon.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8.0,
      width: isActive ? 28.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffCFAAFF) : const Color(0xffD9D9D9),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class _OnboardingPageView extends ConsumerWidget {
  const _OnboardingPageView(this._pageController);

  final PageController _pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      onPageChanged: (value) {
        ref.read(currentOnboardingIndexProvider.notifier).state = value;
      },
      controller: _pageController,
      children: onboardingDataList
          .map((data) => _OnboardingDataSection(data))
          .toList(),
    );
  }
}

class _OnboardingDataSection extends ConsumerWidget {
  const _OnboardingDataSection(this.data);

  final OnboardingData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: authViewHorizontalPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            data.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 8),
          Text(
            data.description,
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 180),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;

  OnboardingData({
    required this.title,
    required this.description,
  });
}

List<OnboardingData> onboardingDataList = [
  OnboardingData(
    title: 'Welcome to Fusshn',
    description:
        'Let\'s turn your party dream into reality! Book your tickets and become a part of the party paradise.',
  ),
  OnboardingData(
    title: 'Let\'s craft your dream event together using Fusshn.',
    description:
        'Gain access to exclusive events and experiences that are not available to the general public.',
  ),
  OnboardingData(
    title: 'The best in your city, curated for you.',
    description:
        'Purchase tickets and passes with ease using our secure checkout process.',
  ),
  OnboardingData(
    title: 'Enjoy complimentary drink, On Us!',
    description:
        'Simply present your booking confirmation at the venue to claim your free drink.',
  ),
];

final currentOnboardingIndexProvider = StateProvider<int>((ref) => 0);

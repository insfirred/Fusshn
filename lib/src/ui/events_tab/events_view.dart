import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common_widgets/animated_gradient_background.dart';
import '../common_widgets/sliver_title.dart';
import '../home_tab/components/search_appbar.dart';
import 'components/events_slider.dart';
import 'components/events_tab_banner.dart';
import 'components/header_events_tab.dart';

@RoutePage()
class EventsView extends ConsumerWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedGradientBackground(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const HeaderEventsTab(),
              const SearchAppBar(),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 180,
                    viewportFraction: 0.9,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                  ),
                  items: [0, 1, 2, 3, 4, 5, 6].map(
                    (i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return const EventsTabBanner();
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverTitle(
                label: 'Happening near you!',
                onTap: () {},
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const EventsSlider(),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverTitle(
                label: 'Music Gigs',
                onTap: () {},
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const EventsSlider(),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverTitle(
                label: 'Techno Trends',
                onTap: () {},
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 11)),
              const EventsSlider(),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverTitle(
                label: 'BYOBs',
                onTap: () {},
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const EventsSlider(),
            ],
          ),
        ),
      ),
    );
  }
}

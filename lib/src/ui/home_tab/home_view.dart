import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/enums.dart';
import '../common_widgets/animated_gradient_background.dart';
import '../common_widgets/sliver_title.dart';
import 'components/event_card.dart';
import 'components/event_category_box.dart';
import 'components/greetings_appbar.dart';
import 'components/home_banner.dart';
import 'components/location_card.dart';
import 'components/search_appbar.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedGradientBackground(
          child: CustomScrollView(
            slivers: [
              const GreetingAppBar(),
              const SearchAppBar(),
              // SliverToBoxAdapter(
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: homeTabHorizontalPadding,
              //     ),
              //     child: Text(
              //       'Trending',
              //       style: Theme.of(context)
              //           .textTheme
              //           .titleMedium
              //           ?.copyWith(fontSize: 18),
              //     ),
              //   ),
              // ),
              SliverTitle(label: 'Trending'),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: EventCategories.values.length,
                    itemBuilder: (context, index) => EventCategoryBox(index),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: CarouselSlider(
                  options: CarouselOptions(
                    // aspectRatio: 16 / 9,
                    height: 360,
                    viewportFraction: 1,
                    autoPlay: true,
                  ),
                  items: [0, 1, 2, 3, 4, 5, 6].map(
                    (i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return const HomeBanner();
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 26)),
              SliverTitle(
                label: 'Happening near you!',
                onTap: () {},
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) => EventCard(index),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              // SliverToBoxAdapter(
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: homeTabHorizontalPadding,
              //     ),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           'Music Events',
              //           style: Theme.of(context).textTheme.titleMedium,
              //         ),
              //         Container(
              //           padding: const EdgeInsets.symmetric(
              //             vertical: 6,
              //             horizontal: 12,
              //           ),
              //           decoration: BoxDecoration(
              //             border: Border.all(
              //               color: const Color(0xFF78F894).withOpacity(0.7),
              //               width: 0.5,
              //             ),
              //             borderRadius: BorderRadius.circular(20),
              //           ),
              //           child: Text(
              //             'View All',
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .bodySmall
              //                 ?.copyWith(
              //                     color:
              //                         const Color(0xFF78F894).withOpacity(0.7)),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SliverTitle(
                label: 'Music Events',
                onTap: () {},
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) => EventCard(index),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverTitle(label: 'Featured Artists'),
              const SliverToBoxAdapter(child: SizedBox(height: 11)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(36),
                              child: Image.asset(
                                'assets/images/test/artist.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              'Seedhe Maut',
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverTitle(
                label: 'Premium Locations',
                onTap: () {},
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) => LocationCard(index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

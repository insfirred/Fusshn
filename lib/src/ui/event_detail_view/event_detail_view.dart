import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/common/dimens.dart';

import '../common_widgets/animated_gradient_background.dart';
import 'components/event_introduction.dart';
import 'components/terms_and_conditions.dart';
import 'components/timing_and_venue.dart';

@RoutePage()
class EventDetailView extends StatelessWidget {
  const EventDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedGradientBackground(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  SliverAppBar(
                    toolbarHeight: 30,
                    leadingWidth: 35,
                    backgroundColor: Colors.transparent,
                    leading: GestureDetector(
                      onTap: () => context.maybePop(),
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: homeTabHorizontalPadding),
                        child: Image.asset(
                          'assets/back.png',
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: homeTabHorizontalPadding),
                        child: Image.asset(
                          'assets/share.png',
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(12),
                    sliver: SliverToBoxAdapter(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/test/dj.jpg',
                          width: 350,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 8)),
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    backgroundColor: Colors.transparent,
                    floating: true,
                    pinned: true,
                    // collapsedHeight: 80,
                    toolbarHeight: 65,
                    title: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Techno - DJ Kalash',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '11 June 2022 • Mahalaxmi Lawns, Pune Road',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '8:30 PM',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 10,
                                      color: const Color(0xFF9BFFB1),
                                    ),
                              ),
                              Text(
                                '11 Jun\'23',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: const Color(0xFF9BFFB1)),
                              )
                            ],
                          ),
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              endIndent: 10,
                              indent: 10,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '4:30 AM',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontSize: 10,
                                        color: const Color(0xFF9BFFB1)),
                              ),
                              Text(
                                '12 Jun\'23',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: const Color(0xFF9BFFB1)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  const TimingAndVenue(),
                  const SliverToBoxAdapter(
                    child: Divider(
                      color: Color(0xFF3F3F3F),
                      indent: 16,
                      endIndent: 16,
                      thickness: 1,
                    ),
                  ),
                  const EventIntroduction(),
                  const SliverToBoxAdapter(child: SizedBox(height: 8)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: homeTabHorizontalPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Artist Lineup',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: const Color(0xFFFAFAFA)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/test/artist.jpeg',
                                        width: 32,
                                        height: 32,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Four Tet, Anish Kumar, HOZHO, Ben Bohmer',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(
                            color: Color(0xFF3F3F3F),
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  const TermsAndConditions(),
                  const SliverToBoxAdapter(child: SizedBox(height: 90)),
                ],
              ),
              Positioned(
                bottom: 30,
                child: Container(
                  width: MediaQuery.of(context).size.width -
                      2 * homeTabHorizontalPadding,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 48, 185, 77),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Book Tickets',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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

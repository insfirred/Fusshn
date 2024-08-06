import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/dimens.dart';
import '../../models/event_data.dart';
import '../common_widgets/animated_gradient_background.dart';
import 'components/artist_lineup_box.dart';
import 'components/book_tickets_btn.dart';
import 'components/date_and_timing_event.dart';
import 'components/event_images_slider.dart';
import 'components/event_introduction.dart';
import 'components/terms_and_conditions.dart';
import 'components/timing_and_venue.dart';

@RoutePage()
class EventDetailView extends StatelessWidget {
  const EventDetailView({
    required this.eventData,
    super.key,
  });

  final EventData eventData;

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

                  // EVENT_IMAGES
                  EventImagesSlider(urls: eventData.imagesUrls),
                  const SliverToBoxAdapter(child: SizedBox(height: 8)),

                  // EVENT_TITLE
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
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
                            eventData.name,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${DateFormat('d MMMM y, ').format(eventData.startTime)} • ${eventData.eventLocation}',
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

                  // DATE_AND_TIMINGS
                  DateAndTimingBox(
                    startTime: eventData.startTime,
                    endTime: eventData.endTime,
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),

                  // TIME, VENUE, ORGANISER
                  TimingAndVenue(
                    startTime: eventData.startTime,
                    endTime: eventData.endTime,
                    gateCloses: eventData.gateCloseTime,
                    location: eventData.eventLocation,
                    organizerName: eventData.organiserName,
                  ),
                  const SliverToBoxAdapter(
                    child: Divider(
                      color: Color(0xFF3F3F3F),
                      indent: 16,
                      endIndent: 16,
                      thickness: 1,
                    ),
                  ),

                  // INTRODUCTION
                  EventIntroduction(
                    intro: eventData.description,
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 8)),

                  // ARTIST LINEUP
                  ArtistLineupBox(lineup: eventData.artistLineup),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),

                  // TERMS AND CONDITIONS
                  TermsAndConditions(
                    termsAndConditions: eventData.termsAndConditions,
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 90)),
                ],
              ),

              // BOOK_TICKETS_BUTTON
              BookTicketsBtn(tickets: eventData.tickets),
            ],
          ),
        ),
      ),
    );
  }
}

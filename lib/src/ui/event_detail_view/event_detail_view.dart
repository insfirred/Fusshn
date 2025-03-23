import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  SliverAppBar(
                    toolbarHeight: 30,
                    leadingWidth: 45,
                    backgroundColor: Colors.transparent,
                    leading: GestureDetector(
                      onTap: () => context.maybePop(),
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: homeTabHorizontalPadding,
                        ),
                        child: Image.asset('assets/back.png'),
                      ),
                    ),

                    // share button
                    // actions: [
                    //   Padding(
                    //     padding: const EdgeInsets.only(
                    //       right: homeTabHorizontalPadding,
                    //     ),
                    //     child: Image.asset(
                    //       'assets/share.png',
                    //       width: 20,
                    //     ),
                    //   ),
                    // ],
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),

                  // EVENT_IMAGES
                  EventImagesSlider(urls: eventData.imagesUrls),
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),

                  // EVENT_TITLE
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    floating: true,
                    pinned: true,
                    toolbarHeight: 70,
                    title: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Text(
                        eventData.name,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        textAlign: TextAlign.center,
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
                  EventIntroduction(eventData.description),
                  const SliverToBoxAdapter(child: SizedBox(height: 8)),

                  // ARTIST LINEUP
                  if (eventData.artistLineup.isNotEmpty) ...[
                    ArtistLineupBox(lineup: eventData.artistLineup),
                    const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  ],

                  // TERMS AND CONDITIONS
                  TermsAndConditions(eventData.termsAndConditions),
                  const SliverToBoxAdapter(child: SizedBox(height: 90)),
                ],
              ),

              // BOOK_TICKETS_BUTTON
              BookTicketsBtn(
                tickets: eventData.tickets,
                event: eventData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

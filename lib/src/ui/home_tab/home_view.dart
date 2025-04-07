import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/models/coordinates_data.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/dimens.dart';
import '../../models/event_data.dart';
import '../../repositories/app_repository.dart';
import '../../routing/app_router.dart';
import '../common_widgets/animated_gradient_background.dart';
import '../common_widgets/sliver_title.dart';
import 'components/events_carousel_slider_section.dart';
import 'components/give_feedback_card.dart';
import 'components/greetings_appbar.dart';
import 'components/horizontal_event_slider.dart';
import 'components/payment_success_alert.dart';
import 'components/search_appbar.dart';
import 'home_view_model.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      homeViewModelProvider,
      (previous, next) {
        if (previous?.paymentSuccessPopupTrigger !=
            next.paymentSuccessPopupTrigger) {
          showDialog(
            context: context,
            builder: (BuildContext context) => paymentSuccessAlert(context),
          );
        }
      },
    );

    // ref.listen(
    //   appRepositoryProvider,
    //   (previous, next) {
    //     if (next.isUpdateAvailable) {
    //       showModalBottomSheet(
    //         backgroundColor: Colors.transparent,
    //         enableDrag: false,
    //         isDismissible: false,
    //         context: context,
    //         builder: (context) => BackdropFilter(
    //           filter: ImageFilter.blur(
    //             sigmaX: 8,
    //             sigmaY: 8,
    //           ),
    //           child: Container(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 32,
    //               vertical: 30,
    //             ),
    //             decoration: const BoxDecoration(
    //               color: Color(0xFF111111),
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(20),
    //                 topRight: Radius.circular(20),
    //               ),
    //             ),
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 Text(
    //                   'New Update Available!!',
    //                   style: GoogleFonts.poppins(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.w400,
    //                     color: const Color(0xFFB3B3B3),
    //                   ),
    //                 ),
    //                 const SizedBox(height: 24),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 44),
    //                   child: Text(
    //                     'Update your Application to the Latest Version',
    //                     style: GoogleFonts.poppins(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w600,
    //                     ),
    //                     textAlign: TextAlign.center,
    //                   ),
    //                 ),
    //                 const SizedBox(height: 20),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 5),
    //                   child: Text(
    //                     'A brand new version of fusshn app is available in the Playstore. Please update your app to use all of our amazing features',
    //                     style: GoogleFonts.poppins(
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.w400,
    //                       color: const Color(0xFFB3B3B3),
    //                     ),
    //                     textAlign: TextAlign.center,
    //                   ),
    //                 ),
    //                 const SizedBox(height: 32),
    //                 ClipRRect(
    //                   borderRadius: BorderRadius.circular(8),
    //                   child: Container(
    //                     color: Theme.of(context).primaryColor,
    //                     child: Material(
    //                       color: Colors.transparent,
    //                       child: InkWell(
    //                         onTap: () {
    //                           // Navigator.pop(context);
    //                         },
    //                         child: Container(
    //                           height: 45,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(8),
    //                           ),
    //                           child: Center(
    //                             child: Text(
    //                               'Update Now',
    //                               style: GoogleFonts.poppins(
    //                                 fontSize: 16,
    //                                 fontWeight: FontWeight.w600,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     }
    //   },
    // );

    final List<EventData> allEvents = ref.watch(
      homeViewModelProvider.select((_) => _.allEvents),
    );

    final List<EventData> nearByEvents = ref.watch(
      homeViewModelProvider.select((_) => _.nearByEvents),
    );

    final showFeedbackCard = ref.watch(
          homeViewModelProvider.select((_) => _.showFeedbackCardOnHome),
        ) &&
        !ref.watch(
          homeViewModelProvider.select((_) => _.tempRemoveFeedbackCard),
        );

    return Scaffold(
      body: SafeArea(
        child: AnimatedGradientBackground(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // GREETINGS SECTION
              const GreetingAppBar(),

              // SEARCH BOX
              const SearchAppBar(),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),

              // CAROUSEL SLIDER
              const SliverToBoxAdapter(
                child: EventsCarouselSliderSection(),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 26)),

              // HAPPENING NEAR YOU Section
              if (nearByEvents.isNotEmpty) ...[
                SliverTitle(
                  label: 'Happening near you!',
                  onTap: () {
                    context.navigateTo(SeeAllEventRoute(events: nearByEvents));
                  },
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 8)),
                SliverToBoxAdapter(
                  child: HorizontalEventSlider(nearByEvents),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],

              // MUSIC EVENTS Section
              SliverTitle(
                label: 'All Events',
                onTap: () {
                  context.navigateTo(
                    SeeAllEventRoute(events: allEvents),
                  );
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              SliverToBoxAdapter(child: HorizontalEventSlider(allEvents)),

              // // FEATURED ARTISTS Section
              // const SliverToBoxAdapter(child: SizedBox(height: 20)),
              // const SliverTitle(label: 'Featured Artists'),
              // const SliverToBoxAdapter(child: SizedBox(height: 11)),
              // SliverToBoxAdapter(
              //   child: SizedBox(
              //     height: 120,
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 6,
              //       itemBuilder: (context, index) => Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 4),
              //         child: Column(
              //           children: [
              //             ClipOval(
              //               child: SizedBox.fromSize(
              //                 size: const Size.fromRadius(36),
              //                 child: Image.asset(
              //                   'assets/images/test/artist.jpeg',
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               width: 80,
              //               child: Text(
              //                 'Seedhe Maut',
              //                 maxLines: 2,
              //                 style: Theme.of(context).textTheme.bodySmall,
              //                 overflow: TextOverflow.ellipsis,
              //                 textAlign: TextAlign.center,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              if (showFeedbackCard) ...[
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                const SliverToBoxAdapter(child: GiveFeedbackCard()),
              ],

              const SliverToBoxAdapter(child: SizedBox(height: 40)),
              // LETS PARTY TOGETHER Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: homeTabHorizontalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Let\'s Party\nTogether <3',
                        style: GoogleFonts.pacifico(
                          fontSize: 50,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Crafted with ❣️ Only for U',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 70)),
            ],
          ),
        ),
      ),
    );
  }
}

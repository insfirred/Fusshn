import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/common/enums.dart';
import 'package:fusshn/src/models/artist_data.dart';
import 'package:fusshn/src/models/ticket_type.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/dimens.dart';
import '../../models/event_data.dart';
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

    final List<EventData> eventDataList = ref.watch(
      homeViewModelProvider.select((_) => _.events),
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
              // const SliverToBoxAdapter(
              //   child: SizedBox(
              //     height: 38,
              //     child: AllEventTagsSection(),
              //   ),
              // ),
              // const SliverToBoxAdapter(child: SizedBox(height: 24)),
              // SliverToBoxAdapter(
              //   child: ElevatedButton(
              //     onPressed: () async {
              //       for (var element in eventsForFirestore) {
              //         await FirebaseFirestore.instance
              //             .collection('events')
              //             .add(element.toJson());
              //       }
              //     },
              //     child: Text('push events'),
              //   ),
              // ),

              // const SliverToBoxAdapter(child: SizedBox(height: 12)),
              // SliverToBoxAdapter(
              //   child: ElevatedButton(
              //     onPressed: () async {
              //       var a = Hive.box<Map>(HiveKeys.myLocationDataBoxKey)
              //           .get(HiveKeys.lastLocationFieldKey);

              //       log(a.toString());
              //     },
              //     child: Text('get city'),
              //   ),
              // ),
              // const SliverToBoxAdapter(child: SizedBox(height: 12)),
              // SliverToBoxAdapter(
              //   child: ElevatedButton(
              //     onPressed: () async {
              //       User? user = FirebaseAuth.instance.currentUser;
              //       // await user?.sendEmailVerification();
              //       await user?.reload();
              //       log('email verified? : ${user?.emailVerified}....');
              //       // FirebaseAuth.instance.applyActionCode(
              //       //     'g5KbDgbedLhr3QIYQ5rChHVnI-TxbIWM764bjTJMIsoAAAGTLtthdw');
              //       // log('link sent.......');
              //     },
              //     child: const Text('Send link'),
              //   ),
              // ),
              // const SliverToBoxAdapter(child: SizedBox(height: 12)),

              // CAROUSEL SLIDER
              const SliverToBoxAdapter(
                child: EventsCarouselSliderSection(),
              ),

              // SliverToBoxAdapter(
              //   child: TextButton(
              //     onPressed: () async {
              //       EventData eventData = EventData(
              //         id: 'id',
              //         name: 'Product Designer\'s Workshop',
              //         description:
              //             'Join us for an interactive workshop focused on the latest UI/UX design trends and techniques. Whether you\'re a beginner or looking to refine your skills, this session will provide valuable insights on creating user-centered designs, enhancing user experience, and mastering design tools. Be prepared for hands-on activities and real-world examples that will elevate your design process!',
              //         artistLineup: [
              //           const ArtistData(
              //             id: 'gv',
              //             name: 'ux.garvit',
              //             imageUrl:
              //                 'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/simulation%2Fartist.jpg?alt=media&token=7127c225-9719-41f1-b202-b17e5512fd5a',
              //           ),
              //         ],
              //         eventLocation: 'Centrum Plaza, Gurgaon',
              //         posterUrl:
              //             'https://images.unsplash.com/photo-1584448097764-374f81551427?q=80&w=2196&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              //         imagesUrls: [
              //           'https://images.unsplash.com/photo-1552664730-d307ca884978?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              //           'https://images.unsplash.com/photo-1552581234-26160f608093?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
              //         ],
              //         startTime: DateTime(2025, 3, 27, 11, 15),
              //         endTime: DateTime(2025, 3, 27, 14),
              //         tickets: [
              //           const TicketType(
              //             id: 'sp',
              //             name: 'Student Pass',
              //             price: 400,
              //             personAllowedPerTicket: 1,
              //             personGender: Gender.male,
              //             description: 'One student entry pass',
              //             isRefundable: false,
              //             totalTickets: 50,
              //             availableTickets: 50,
              //           ),
              //           const TicketType(
              //             id: 'eb',
              //             name: 'Early Bird',
              //             price: 1179,
              //             personAllowedPerTicket: 1,
              //             personGender: Gender.male,
              //             description: 'Pass for early birds',
              //             isRefundable: false,
              //             totalTickets: 50,
              //             availableTickets: 50,
              //           ),
              //         ],
              //         ageRestrictions: 16,
              //         organiserName: 'Garvit Verma',
              //         termsAndConditions: [
              //           'The ticket is a revocable license to enter the event and is subject to the terms and conditions of the festival.',
              //           'The ticket holder agrees to comply with all rules and regulations of the festival.',
              //           'The ticket holder voluntarily assumes all risk and danger incidental to the event, whether occurring before, during, or after the event.',
              //           'The event promoter reserves the right to refuse admission or eject any person whose conduct is deemed to be disorderly or who fails to comply with the terms and conditions of the event.',
              //           'The event promoter is not responsible for lost or stolen items, and attendees are advised not to bring valuable items to the festival.',
              //           'The event promoter may use any photos or videos taken at the event for promotional purposes.',
              //           'The event promoter reserves the right to change the lineup, schedule, or location of the event without prior notice.',
              //           'The ticket holder agrees to submit to a reasonable search for prohibited items upon entering the festival.',
              //           'The ticket holder may not bring outside food, drink, or illegal substances to the festival.',
              //           'The ticket holder may not resell or transfer their ticket without the express written consent of the event promoter.',
              //         ],
              //         tags: ['workshop'],
              //       );

              //       await FirebaseFirestore.instance
              //           .collection('events')
              //           .add(eventData.toJson())
              //           .then(
              //         (doc) {
              //           doc.update(
              //             {"id": doc.id},
              //           );
              //         },
              //       );

              //       log('Event added successfully!!!');
              //     },
              //     child: Text('Push Event Data'),
              //   ),
              // ),

              // HAPPENING NEAR YOU Section
              const SliverToBoxAdapter(child: SizedBox(height: 26)),
              SliverTitle(
                label: 'Happening near you!',
                onTap: () {
                  context.navigateTo(SeeAllEventRoute(events: eventDataList));
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const SliverToBoxAdapter(
                child: HorizontalEventSlider(),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),

              // MUSIC EVENTS Section
              SliverTitle(
                label: 'Music Events',
                onTap: () {
                  context.navigateTo(
                    SeeAllEventRoute(events: eventDataList),
                  );
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const SliverToBoxAdapter(child: HorizontalEventSlider()),

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

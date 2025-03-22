import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

              // SliverToBoxAdapter(
              //   child: TextButton(
              //     onPressed: () async {
              //       Booking booking = Booking(
              //         id: '1',
              //         paymentId: '1',
              //         eventId: '1',
              //         ticketType: eventsForFirestore.first.tickets.first,
              //         ticketCount: 1,
              //         createdAt: DateTime.now(),
              //         userId: '1',
              //         userName: '1',
              //         userEmail: '1',
              //         userPhone: '1',
              //         isCheckIn: false,
              //         numberOfUserCheckedIn: 0,
              //         totalUserAllowed: 1,
              //       );

              //       // booking added to booking collection...
              //       var a = booking.toJson();
              //       await FirebaseFirestore.instance
              //           .collection('bookings')
              //           .add(a);
              //     },
              //     child: const Text("Add Booking"),
              //   ),
              // ),

              // CAROUSEL SLIDER
              const SliverToBoxAdapter(
                child: EventsCarouselSliderSection(),
              ),

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

              // const SliverToBoxAdapter(child: SizedBox(height: 20)),
              // // FEATURED ARTISTS Section
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

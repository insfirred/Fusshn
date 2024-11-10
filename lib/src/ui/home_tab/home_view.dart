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

    return Scaffold(
      body: SafeArea(
        child: AnimatedGradientBackground(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const GreetingAppBar(),
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
              //       await Hive.box<Map>(HiveKeys.myLocationDataBoxKey)
              //           .delete(HiveKeys.lastLocationFieldKey);
              //       log('deleted...');
              //     },
              //     child: Text('remove city'),
              //   ),
              // ),
              // const SliverToBoxAdapter(child: SizedBox(height: 12)),

              const SliverToBoxAdapter(
                child: EventsCarouselSliderSection(),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 26)),
              SliverTitle(
                label: 'Happening near you!',
                onTap: () {
                  context.navigateTo(
                    SeeAllEventRoute(events: eventDataList),
                  );
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const SliverToBoxAdapter(
                child: HorizontalEventSlider(),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverTitle(
                label: 'Music Events',
                onTap: () {
                  context.navigateTo(
                    SeeAllEventRoute(events: eventDataList),
                  );
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const SliverToBoxAdapter(
                child: HorizontalEventSlider(),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const SliverTitle(label: 'Featured Artists'),
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
              const SliverToBoxAdapter(child: SizedBox(height: 40)),
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
                        'Crafted with ❣️ by Kalash and Garvit',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        ),
      ),
    );
  }
}

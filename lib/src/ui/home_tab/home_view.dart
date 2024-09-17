import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../common/enums.dart';
import '../../models/event_data.dart';
import '../common_widgets/animated_gradient_background.dart';
import '../common_widgets/fusshn_btn.dart';
import '../common_widgets/sliver_title.dart';
import 'components/event_card.dart';
import 'components/event_category_box.dart';
import 'components/greetings_appbar.dart';
import 'components/home_banner.dart';
import 'components/location_card.dart';
import 'components/search_appbar.dart';
import 'home_view_model.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var paymentSuccessAlert = BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 3.5,
        sigmaY: 3.5,
      ),
      child: AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Center(
          child: Column(
            children: [
              Lottie.asset(
                'assets/lottie/payment_success.json',
              ),
              const SizedBox(height: 10),
              const Text(
                'Yayy',
              ),
            ],
          ),
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .displaySmall
            ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
        content: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your booking is successful",
            ),
          ],
        ),
        contentTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF78F894),
            ),
        contentPadding: const EdgeInsets.only(top: 15, bottom: 17),
        actions: [
          FusshnBtn(
            height: 40,
            width: 180,
            onTap: () {},
            label: 'View Ticket',
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
      ),
    );

    ref.listen(
      homeViewModelProvider,
      (previous, next) {
        if (previous?.popupTrigger != next.popupTrigger) {
          showDialog(
            context: context,
            builder: (BuildContext context) => paymentSuccessAlert,
          );
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: AnimatedGradientBackground(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const GreetingAppBar(),
              const SearchAppBar(),
              const SliverTitle(label: 'Trending'),
              // SliverToBoxAdapter(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       FirebaseFirestore.instance
              //           .collection('events')
              //           .add(eventWasteData.toJson())
              //           .then(
              //         (doc) {
              //           doc.update({"id": doc.id});
              //         },
              //       );
              //     },
              //     child: const Text("Push Event Data"),
              //   ),
              // ),

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
              const SliverToBoxAdapter(
                child: HorizontalEventSlider(),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverTitle(
                label: 'Music Events',
                onTap: () {},
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

class HorizontalEventSlider extends ConsumerWidget {
  const HorizontalEventSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<EventData> eventDataList = ref.watch(
      homeViewModelProvider.select((_) => _.events),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eventDataList.length,
        itemBuilder: (context, index) => EventCard(
          eventData: eventDataList[index],
          index: index,
        ),
      ),
    );
  }
}

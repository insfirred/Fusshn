import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'events_tab_card.dart';

class EventsSlider extends StatelessWidget {
  const EventsSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
          padEnds: false,
          aspectRatio: 285 / 232,
          viewportFraction: 0.69,
          // autoPlay: true,
          enableInfiniteScroll: false,
        ),
        items: [0, 1, 2, 3, 4, 5, 6].map(
          (i) {
            return Builder(
              builder: (BuildContext context) {
                return const EventsTabCard();
              },
            );
          },
        ).toList(),
      ),
    );
  }
}

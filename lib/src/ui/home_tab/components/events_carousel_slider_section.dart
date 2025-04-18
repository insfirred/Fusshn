import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../models/event_data.dart';
import '../home_view_model.dart';
import 'home_banner.dart';

class EventsCarouselSliderSection extends ConsumerStatefulWidget {
  const EventsCarouselSliderSection({super.key});

  @override
  ConsumerState<EventsCarouselSliderSection> createState() =>
      _EventsCarouselSliderSectionState();
}

class _EventsCarouselSliderSectionState
    extends ConsumerState<EventsCarouselSliderSection> {
  late CarouselSliderController controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    final List<EventData> eventDataList = ref.watch(
      homeViewModelProvider.select((_) => _.allEvents),
    );

    final status = ref.watch(
      homeViewModelProvider.select((_) => _.status),
    );

    return Column(
      children: [
        status == HomeViewStatus.loading
            ? const _EventCaroselShimmer()
            : CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                  height: 360,
                  viewportFraction: 1,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: eventDataList.map(
                  (event) {
                    return Builder(
                      builder: (BuildContext context) {
                        return HomeBanner(event);
                      },
                    );
                  },
                ).toList(),
              ),
        const SizedBox(height: 8),
        SizedBox(
          height: 6,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                _CarouselDot(_currentIndex == index),
            separatorBuilder: (context, index) => const SizedBox(width: 4),
            itemCount: eventDataList.length,
          ),
        ),
      ],
    );
  }
}

class _CarouselDot extends StatelessWidget {
  const _CarouselDot(this.isActive);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isActive ? Theme.of(context).primaryColor : const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(6),
      ),
      width: isActive ? 15 : 6,
      height: 6,
    );
  }
}

class _EventCaroselShimmer extends StatelessWidget {
  const _EventCaroselShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 800),
      baseColor: Colors.black12,
      highlightColor: Colors.grey.shade900,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[900],
        ),
        height: 360,
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventImagesSlider extends StatelessWidget {
  EventImagesSlider({
    super.key,
    required this.urls,
  });

  final CarouselController buttonCarouselController = CarouselController();
  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            items: urls
                .map(
                  (url) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      url,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
                .toList(),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              enlargeFactor: 0.5,
              aspectRatio: 16 / 9,
              initialPage: 0,
            ),
          ),
          // Container(
          //   color: Colors.amber,
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: homeTabHorizontalPadding),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () => buttonCarouselController.previousPage(
          //             duration: const Duration(milliseconds: 300),
          //             curve: Curves.linear),
          //         child: const Text('<-'),
          //       ),
          //       ElevatedButton(
          //         onPressed: () => buttonCarouselController.nextPage(
          //             duration: const Duration(milliseconds: 300),
          //             curve: Curves.linear),
          //         child: const Text('→'),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

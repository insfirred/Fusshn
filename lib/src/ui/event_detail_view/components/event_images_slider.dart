import 'package:cached_network_image/cached_network_image.dart';
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
                    child: CachedNetworkImage(
                      imageUrl: url,
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
        ],
      ),
    );
  }
}

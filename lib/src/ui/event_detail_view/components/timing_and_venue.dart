import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/dimens.dart';
import '../../../models/coordinates_data.dart';

class TimingAndVenue extends StatelessWidget {
  const TimingAndVenue({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.locationText,
    required this.organizerName,
    required this.coordinates,
  });

  final DateTime startTime;
  final DateTime endTime;
  final String locationText;
  final CoordinatesData coordinates;
  final String organizerName;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: homeTabHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Timing & Venue',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/clock.png',
                        width: 14,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Start Time :',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    DateFormat.jm().format(startTime),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/cross_circle.png',
                        width: 14,
                        color: const Color(0xFFBB1616),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'End Time :',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    DateFormat.jm().format(endTime),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/location.png',
                        width: 14,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Venue :',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: _launchUrl,
                        child: Text(
                          locationText,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: const Color(0xFFF1F1F1),
                                  ),
                        ),
                      ),
                      // const _EventLocationBox(
                      //   lat: 28.396366244820598,
                      //   lng: 77.10404872451666,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/person.png',
                        width: 14,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Organiser :',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    organizerName,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF9BFFB1),
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xFF9BFFB1),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    log('opening maps at ${coordinates.lattitude}, ${coordinates.longitude}');

    if (!await launchUrl(
      Uri.parse(
        'https://www.google.com/maps/@${coordinates.lattitude},${coordinates.longitude},18z',
      ),
    )) {
      throw Exception('Something went wrong on launching map url...');
    }
  }
}

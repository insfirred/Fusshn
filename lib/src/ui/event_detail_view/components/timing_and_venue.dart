import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/dimens.dart';

class TimingAndVenue extends StatelessWidget {
  const TimingAndVenue({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.organizerName,
  });

  final DateTime startTime;
  final DateTime endTime;
  final String location;
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
                        'assets/clock.png',
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
                      Text(
                        location,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: const Color(0xFFFFFFFF),
                            ),
                      ),
                      Text(
                        '100 FT, DP Rd, near Rajaram Bridge, Karve Nagar, Pune, Maharashtra 411052',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: const Color(0xFF808080)),
                      ),
                      const _EventLocationBox(
                        lat: 1,
                        lng: 1,
                        // 28.396366244820598, 77.10404872451666
                      ),
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
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xFFFFFFFF),
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
}

class _EventLocationBox extends StatelessWidget {
  const _EventLocationBox({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      behavior: HitTestBehavior.opaque,
      child: Text(
        'Tap to view location',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: const Color(0xFFFFFFFF),
            ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    print('opening maps');
    if (!await launchUrl(
        Uri.parse('https://www.google.com/maps/place/$lat,$lng'))) {
      throw Exception('Something went wrong on launching map url...');
    }
  }
}

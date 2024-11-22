import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAndTimingBox extends StatelessWidget {
  const DateAndTimingBox({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  final DateTime startTime;
  final DateTime endTime;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat.jm().format(startTime),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        color: const Color(0xFF9BFFB1),
                      ),
                ),
                Text(
                  DateFormat('d MMM y').format(startTime),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: const Color(0xFF9BFFB1)),
                )
              ],
            ),
            const Expanded(
              child: Divider(
                thickness: 1,
                endIndent: 10,
                indent: 10,
                color: Color(0xFFFFFFFF),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.jm().format(endTime),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 10, color: const Color(0xFFFF8181)),
                ),
                Text(
                  DateFormat('d MMM y').format(endTime),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: const Color(0xFFFF8181)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

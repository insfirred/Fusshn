import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/models/event_data.dart';
import 'package:fusshn/src/routing/app_router.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.index,
    required this.eventData,
  });

  final int index;
  final EventData eventData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(EventDetailRoute(eventData: eventData)),
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.only(
          left: index == 0 ? 16 : 6,
          right: index == 6 - 1 ? 16 : 6,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            _Image(eventData.posterUrl),
            const _Gradient(),
            _Data(eventData),
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image(this.url);

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url,
        height: 285,
        width: 232,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Gradient extends StatelessWidget {
  const _Gradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
      width: 232,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            const Color(0xFF000000).withOpacity(0),
            const Color(0xFF000000).withOpacity(0.9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0, 0.67],
        ),
        // color: Colors.black.withOpacity(0.9),
      ),
    );
  }
}

class _Data extends StatelessWidget {
  const _Data(this.eventData);

  final EventData eventData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 285,
      width: 232,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventData.name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/location.png',
                    width: 10,
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 190,
                    child: Text(
                      eventData.eventLocation,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Image.asset(
                    'assets/calender.png',
                    width: 10,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('d MMMM y, ')
                        .add_jm()
                        .format(eventData.startTime),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: const Color(0xFF78F894).withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'From \$999',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}

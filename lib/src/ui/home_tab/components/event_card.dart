import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/event_data.dart';
import '../../../routing/app_router.dart';

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
      child: CachedNetworkImage(
        imageUrl: url,
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
      ),
    );
  }
}

class _Data extends StatefulWidget {
  const _Data(this.eventData);

  final EventData eventData;

  @override
  State<_Data> createState() => _DataState();
}

class _DataState extends State<_Data> {
  double initialTicketPrice = double.maxFinite;

  @override
  void initState() {
    super.initState();
    for (var t in widget.eventData.tickets) {
      if (t.price < initialTicketPrice) {
        initialTicketPrice = t.price;
      }
    }
  }

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
            widget.eventData.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 16,
                ),
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
                      widget.eventData.eventLocationText,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
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
                        .format(widget.eventData.startTime),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  'From \u{20B9}${initialTicketPrice.toInt()}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Book Now',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

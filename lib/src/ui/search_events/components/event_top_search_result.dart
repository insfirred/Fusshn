import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/models/event_data.dart';
import 'package:fusshn/src/routing/app_router.dart';
import 'package:intl/intl.dart';

class EventTopSearchResult extends StatelessWidget {
  const EventTopSearchResult(
    this.eventData, {
    super.key,
  });

  final EventData eventData;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        onTap: () => context.navigateTo(EventDetailRoute(eventData: eventData)),
        title: Text(eventData.name),
        titleTextStyle:
            Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        subtitle: Text(
          '${DateFormat().add_jm().format(eventData.startTime)}, ${DateFormat('d MMMM y').format(eventData.startTime)}',
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            eventData.posterUrl,
            width: 40,
            height: 40,
            cacheWidth: 40,
            cacheHeight: 40,
          ),
        ),
      ),
    );
  }
}

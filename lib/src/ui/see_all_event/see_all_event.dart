import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/routing/app_router.dart';
import 'package:intl/intl.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../common/dimens.dart';
import '../../models/event_data.dart';
import '../common_widgets/fusshn_appbar.dart';

@RoutePage()
class SeeAllEventView extends StatelessWidget {
  const SeeAllEventView({
    required this.events,
    super.key,
  });

  final List<EventData> events;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding:
            const EdgeInsets.symmetric(horizontal: homeTabHorizontalPadding),
        child: Column(
          children: [
            const FusshnAppBar(label: 'Happening near you'),
            const SizedBox(height: 30),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: events.length,
              itemBuilder: (context, index) => _SeeAllEventCard(events[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 18),
            ),
          ],
        ),
      )),
    );
  }
}

class _SeeAllEventCard extends StatelessWidget {
  const _SeeAllEventCard(this.event);

  final EventData event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(EventDetailRoute(eventData: event));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 6),
              blurRadius: 4,
              spreadRadius: 0,
              color: const Color(0xFF3D3D3D).withOpacity(0.3),
            ),
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
              color: const Color(0xFF3D3D3D).withOpacity(0.3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                event.imagesUrls[0],
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      SvgPicture.asset('assets/location.svg'),
                      const SizedBox(width: 4),
                      Text(
                        event.eventLocation,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset('assets/calendar.svg'),
                      const SizedBox(width: 4),
                      Text(
                        '${DateFormat('d MMMM y, ').add_jm().format(event.startTime)} - ${DateFormat.jm().format(event.endTime)}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const _TagBox('Cocktails'),
                      const SizedBox(width: 8),
                      const _TagBox('Music'),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          'From \$${event.tickets.first.price.toInt()}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TagBox extends StatelessWidget {
  const _TagBox(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 10),
      ),
    );
  }
}

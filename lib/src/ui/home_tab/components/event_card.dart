import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/routing/app_router.dart';

class EventCard extends StatelessWidget {
  const EventCard(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(const EventDetailRoute()),
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.only(
          left: index == 0 ? 16 : 6,
          right: index == 6 - 1 ? 16 : 6,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: const Stack(
          children: [
            _Image(),
            _Gradient(),
            _Data(),
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        'assets/images/test/event2.jpeg',
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
  const _Data();

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
            'Techno - DJ Kalash',
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
                      'Club Khubani, Near petrol Pump, Aerocity',
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
                    '30th September, 8:30 PM',
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

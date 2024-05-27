import 'package:flutter/material.dart';

class EventsTabCard extends StatelessWidget {
  const EventsTabCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SizedBox(
              width: 232,
              height: 285,
              child: Image.asset(
                'assets/images/test/event_portrait.png',
                fit: BoxFit.fill,
              ),
            ),
            const _Gradient(),
            const _Data(),
          ],
        ),
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
      child: Column(
        children: [
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _TagBox(label: 'Pop'),
                      _TagBox(label: 'DHH'),
                    ],
                  ),
                  _TagBox(label: 'Bollywood'),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD2D2D2).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '30',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Sep',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            'Techno Blizzard - DJ Nash, DJ Sukhwinder',
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
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
          const SizedBox(height: 12),
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

class _TagBox extends StatelessWidget {
  const _TagBox({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.35),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 8),
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
          stops: const [0, 0.8],
        ),
      ),
    );
  }
}

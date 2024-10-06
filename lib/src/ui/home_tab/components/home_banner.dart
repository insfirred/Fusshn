import 'package:flutter/material.dart';

import '../../../common/dimens.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Image.asset(
            'assets/images/test/event.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: homeTabHorizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Techno Blizzard - DJ Nash, DJ Sukhwinder',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                          Text(
                            'Club Khubani, Aerocity',
                            style: Theme.of(context).textTheme.bodySmall,
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
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'From \$299',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5)
            ],
          ),
        ),
      ],
    );
  }
}

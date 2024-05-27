import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/dimens.dart';

class EventIntroduction extends StatefulWidget {
  const EventIntroduction({
    super.key,
  });

  @override
  State<EventIntroduction> createState() => _EventIntroductionState();
}

class _EventIntroductionState extends State<EventIntroduction> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: homeTabHorizontalPadding,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Introduction',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: isVisible
                        ? Image.asset(
                            'assets/dropdown_inverted.png',
                            width: 12,
                          )
                        : Image.asset(
                            'assets/dropdown.png',
                            width: 12,
                          ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            if (isVisible) ...[
              Text(
                'The people, the energy, the music, the vibe. The mood. The picture-perfect sunsets, sprawling lawns, dominating energy, and the enigmatic landscape. With the bustling city of Pune dotting the backdrop of the festival, the 13th edition of BACARDÍ NH7 Weekender is set to be a grand affair.\n\nSo, head on over to the Happiest Music Festival for a time of eclectic acts, stunning performances, music that will leave you swooning, and memories that you’ll hold on to forever. Sip on cocktails, try the exciting food line-up, experience the art installations, catch a show atop the Ferris wheel, and let the festival spirit fill your soul.\n\nWe can’t wait to see our Weekender Warriors back home in Pune, where it all began.\n\n#13MeraWeekender',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: const Color(0xFFB0B0B0)),
              ),
            ],
            const Divider(
              color: Color(0xFF3F3F3F),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}

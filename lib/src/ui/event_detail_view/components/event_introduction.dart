import 'package:flutter/material.dart';

import '../../../common/dimens.dart';

class EventIntroduction extends StatefulWidget {
  const EventIntroduction(
    this.intro, {
    super.key,
  });

  final String intro;

  @override
  State<EventIntroduction> createState() => _EventIntroductionState();
}

class _EventIntroductionState extends State<EventIntroduction> {
  bool showFullIntro = false;

  @override
  void initState() {
    super.initState();
    if (widget.intro.length <= 280) {
      showFullIntro = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: homeTabHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            if (widget.intro.length <= 280) ...[
              Text(
                widget.intro,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFFB0B0B0),
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ] else ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showFullIntro) ...[
                    Text(
                      widget.intro,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: const Color(0xFFB0B0B0),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ] else ...[
                    Text(
                      '${widget.intro.substring(0, 280)}...',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: const Color(0xFFB0B0B0),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showFullIntro = !showFullIntro;
                      });
                    },
                    child: Text(
                      showFullIntro ? 'See Less' : 'See More',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ],
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

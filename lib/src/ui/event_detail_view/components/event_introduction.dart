import 'package:flutter/material.dart';

import '../../../common/dimens.dart';

class EventIntroduction extends StatefulWidget {
  const EventIntroduction({
    super.key,
    required this.intro,
  });

  final String intro;

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
                widget.intro,
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

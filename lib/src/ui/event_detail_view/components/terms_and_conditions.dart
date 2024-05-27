import 'package:flutter/material.dart';

import '../../../common/dimens.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
                    'Terms & Conditions',
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
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: termsAndConditions.length,
                itemBuilder: (context, index) => _TermItem(
                  index: index,
                  label: '',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TermItem extends StatelessWidget {
  const _TermItem({
    required this.index,
    required this.label,
  });

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '${index + 1}. ',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: const Color(0xFFB0B0B0)),
            ),
          ),
          Expanded(
            flex: 14,
            child: Text(
              termsAndConditions[index],
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: const Color(0xFFB0B0B0)),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> termsAndConditions = [
  'The ticket is a revocable license to enter the event and is subject to the terms and conditions of the festival.',
  'The ticket holder agrees to comply with all rules and regulations of the festival.',
  'The ticket holder voluntarily assumes all risk and danger incidental to the event, whether occurring before, during, or after the event.',
  'The event promoter reserves the right to refuse admission or eject any person whose conduct is deemed to be disorderly or who fails to comply with the terms and conditions of the event.',
  'The event promoter is not responsible for lost or stolen items, and attendees are advised not to bring valuable items to the festival.',
  'The event promoter may use any photos or videos taken at the event for promotional purposes.',
  'The event promoter reserves the right to change the lineup, schedule, or location of the event without prior notice.',
  'The ticket holder agrees to submit to a reasonable search for prohibited items upon entering the festival.',
  'The ticket holder may not bring outside food, drink, or illegal substances to the festival.',
  'The ticket holder may not resell or transfer their ticket without the express written consent of the event promoter.',
];

import 'package:flutter/material.dart';

import '../../../common/dimens.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({
    super.key,
    required this.termsAndConditions,
  });

  final List<String> termsAndConditions;

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
                itemCount: widget.termsAndConditions.length,
                itemBuilder: (context, index) => _TermItem(
                  index: index,
                  label: widget.termsAndConditions[index],
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
              label,
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

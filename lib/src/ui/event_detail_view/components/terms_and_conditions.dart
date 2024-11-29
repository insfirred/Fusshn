import 'package:flutter/material.dart';

import '../../../common/dimens.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions(
    this.termsAndConditions, {
    super.key,
  });

  final List<String> termsAndConditions;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool showAllTerms = false;

  @override
  void initState() {
    super.initState();
    if (widget.termsAndConditions.length <= 3) {
      showAllTerms = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: homeTabHorizontalPadding,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Terms & Conditions',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (widget.termsAndConditions.length <= 3) ...[
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.termsAndConditions.length,
                  itemBuilder: (context, index) => _TermItem(
                    index: index,
                    label: widget.termsAndConditions[index],
                  ),
                ),
              ] else ...[
                if (showAllTerms) ...[
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.termsAndConditions.length,
                    itemBuilder: (context, index) => _TermItem(
                      index: index,
                      label: widget.termsAndConditions[index],
                    ),
                  ),
                ] else ...[
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) => _TermItem(
                      index: index,
                      label: widget.termsAndConditions[index],
                    ),
                  ),
                ],
              ],
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showAllTerms = !showAllTerms;
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Text(
                    showAllTerms ? 'See Less' : 'See More',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.5),
                        ),
                  ),
                ),
              ),
            ],
          ),
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
                  ?.copyWith(color: Colors.black, fontSize: 12),
            ),
          ),
          Expanded(
            flex: 20,
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.black, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../common/dimens.dart';

class SliverTitle extends StatelessWidget {
  const SliverTitle({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: homeTabHorizontalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (onTap != null) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF78F894).withOpacity(0.7),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'See All',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF78F894).withOpacity(0.7)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

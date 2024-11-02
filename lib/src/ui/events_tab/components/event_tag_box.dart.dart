import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/ui/events_tab/event_view_model.dart';

import '../../../common/dimens.dart';

class EventTagBox extends ConsumerWidget {
  const EventTagBox({
    required this.label,
    required this.isSelected,
    this.isFirst = false,
    this.isLast = false,
    super.key,
  });

  final String label;
  final bool isFirst;
  final bool isLast;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        isSelected
            ? ref.read(eventViewModelProvider.notifier).setTagInFilter(null)
            : ref.read(eventViewModelProvider.notifier).setTagInFilter(label);
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: EdgeInsets.only(
          left: isFirst ? homeTabHorizontalPadding : 4,
          right: isLast ? homeTabHorizontalPadding : 4,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF78F894).withOpacity(0.7) : null,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 0.5,
            color: isSelected
                ? const Color(0xFF78F894).withOpacity(0.7)
                : const Color(0xFFFFFFFF).withOpacity(0.7),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}

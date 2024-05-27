import 'package:flutter/material.dart';

import '../../../common/dimens.dart';
import '../../../common/enums.dart';

class EventCategoryBox extends StatelessWidget {
  const EventCategoryBox(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    String label = EventCategories.values[index].name.replaceAll('_', ' ');
    return Container(
      margin: EdgeInsets.only(
        left: index == 0 ? 0 + homeTabHorizontalPadding : 4,
        right: index == EventCategories.values.length - 1
            ? 0 + homeTabHorizontalPadding
            : 4,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 0.5,
          color: const Color(0xFFFFFFFF).withOpacity(0.7),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}

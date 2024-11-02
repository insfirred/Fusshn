import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/event_tags.dart';
import 'event_tag_box.dart.dart';
import '../event_view_model.dart';

class AllEventTagsSection extends ConsumerWidget {
  const AllEventTagsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTag = ref.watch(
      eventViewModelProvider.select((_) => _.selectedTag),
    );

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: EventTags.allEventTags.length,
      itemBuilder: (context, index) => EventTagBox(
        label: EventTags.allEventTags[index],
        isSelected: selectedTag == EventTags.allEventTags[index],
        isFirst: index == 0,
        isLast: index == EventTags.allEventTags.length - 1,
      ),
    );
  }
}

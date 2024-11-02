import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/dimens.dart';
import '../event_view_model.dart';
import 'events_tab_card.dart';

class EventTabList extends ConsumerWidget {
  const EventTabList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(
      eventViewModelProvider.select((_) => _.filteredEvents),
    );

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: homeTabHorizontalPadding),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) => EventTabCard(events[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 18),
    );
  }
}

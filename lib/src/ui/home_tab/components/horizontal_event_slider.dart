import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/event_data.dart';
import '../home_view_model.dart';
import 'event_card.dart';

class HorizontalEventSlider extends ConsumerWidget {
  const HorizontalEventSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<EventData> eventDataList = ref.watch(
      homeViewModelProvider.select((_) => _.events),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eventDataList.length,
        itemBuilder: (context, index) => EventCard(
          eventData: eventDataList[index],
          index: index,
        ),
      ),
    );
  }
}

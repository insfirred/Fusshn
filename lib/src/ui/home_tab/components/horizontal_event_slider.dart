import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

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

    final status = ref.watch(
      homeViewModelProvider.select((_) => _.status),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 300,
      child: status == HomeViewStatus.loading
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) => _EventCardShimmer(index),
            )
          : ListView.builder(
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

class _EventCardShimmer extends StatelessWidget {
  const _EventCardShimmer(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 800),
      baseColor: Colors.black12,
      highlightColor: Colors.grey.shade900,
      child: Container(
        margin: EdgeInsets.only(
          left: index == 0 ? 16 : 6,
          right: index == 6 - 1 ? 16 : 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[900],
        ),
        height: 285,
        width: 232,
      ),
    );
  }
}

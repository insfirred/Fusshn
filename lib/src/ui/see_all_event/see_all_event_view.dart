import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../common/dimens.dart';
import '../../models/event_data.dart';
import '../common_widgets/fusshn_appbar.dart';
import '../events_tab/components/events_tab_card.dart';

@RoutePage()
class SeeAllEventView extends StatelessWidget {
  const SeeAllEventView({
    required this.events,
    super.key,
  });

  final List<EventData> events;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding:
            const EdgeInsets.symmetric(horizontal: homeTabHorizontalPadding),
        child: Column(
          children: [
            const FusshnAppBar(label: 'Happening near you'),
            const SizedBox(height: 30),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: events.length,
              itemBuilder: (context, index) => EventTabCard(events[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 18),
            ),
          ],
        ),
      )),
    );
  }
}
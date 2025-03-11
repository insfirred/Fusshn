import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../common/dimens.dart';
import '../common_widgets/animated_gradient_background.dart';
import 'components/all_event_tags_section.dart';
import 'components/event_tab_list.dart';
import 'components/event_tab_searchbar.dart';

@RoutePage()
class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedGradientBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(homeTabHorizontalPadding),
                child: Text(
                  'Explore Events',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: homeTabHorizontalPadding,
                        ),
                        child: EventTabSearchBar(),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 38,
                        child: AllEventTagsSection(),
                      ),
                      SizedBox(height: 24),
                      EventTabList(),
                      SizedBox(height: 20),
                    ],
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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/dimens.dart';
import 'components/artist_top_search_result.dart';
import 'components/event_top_search_result.dart';
import 'components/heading_with_divider.dart';
import 'components/search_event_textfield.dart';
import 'search_event_view_model.dart';

@RoutePage()
class SearchEventView extends ConsumerWidget {
  const SearchEventView({
    required this.heroTagForSearchbar,
    super.key,
  });

  final String heroTagForSearchbar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredList = ref.watch(
      searchEventViewModelProvider.select((_) => _.filteredEvents),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: homeTabHorizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              SearchEventTextfield(heroTagForSearchbar),
              const SizedBox(height: 20),
              const HeadingWithDivider('Events'),
              const SizedBox(height: 10),
              Column(
                children: filteredList
                    .map((event) => EventTopSearchResult(event))
                    .toList(),
              ),
              const SizedBox(height: 20),
              const HeadingWithDivider('Artists'),
              const SizedBox(height: 10),
              const ArtistTopSearchResult(),
              const ArtistTopSearchResult(),
            ],
          ),
        ),
      ),
    );
  }
}

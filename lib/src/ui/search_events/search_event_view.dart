import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../common/dimens.dart';
import '../../common/hero_tags.dart';
import 'components/artist_search_result.dart';
import 'components/event_search_result.dart';
import 'components/search_event_textfield.dart';

@RoutePage()
class SearchEventView extends StatelessWidget {
  const SearchEventView({super.key});

  @override
  Widget build(BuildContext context) {
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
              const SearchEventTextfield(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Events',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 12),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: Divider(color: Color(0xFF3B3B3B))),
                ],
              ),
              const SizedBox(height: 10),
              const EventSearchResult(),
              const EventSearchResult(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Artists',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 12),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: Divider(color: Color(0xFF3B3B3B))),
                ],
              ),
              const SizedBox(height: 10),
              const ArtistSearchResult(),
              const ArtistSearchResult(),
            ],
          ),
        ),
      ),
    );
  }
}

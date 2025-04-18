import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../common/hero_tags.dart';
import '../../../routing/app_router.dart';

class EventTabSearchBar extends StatelessWidget {
  const EventTabSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: HeroTags.searchEventTextfieldEventTab,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: GestureDetector(
            onTap: () => context.navigateTo(SearchEventRoute(
              heroTagForSearchbar: HeroTags.searchEventTextfieldEventTab,
            )),
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF404040).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: TextField(
                  enabled: false,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintFadeDuration: const Duration(milliseconds: 200),
                    icon: Image.asset(
                      'assets/search.png',
                      width: 14,
                      color: const Color(0xFF78F894).withOpacity(0.7),
                    ),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFFFFFFFF).withOpacity(0.7),
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

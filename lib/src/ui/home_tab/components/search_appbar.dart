import 'dart:ui';

import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.transparent,
      floating: true,
      pinned: true,
      collapsedHeight: 80,
      toolbarHeight: 80,
      centerTitle: true,
      title: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF404040).withOpacity(0.5),
              borderRadius: BorderRadius.circular(32),
            ),
            child: TextField(
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
    );
  }
}

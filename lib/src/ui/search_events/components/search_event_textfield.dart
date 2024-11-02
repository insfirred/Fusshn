import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/ui/search_events/search_event_view_model.dart';

import '../../../common/hero_tags.dart';

class SearchEventTextfield extends ConsumerStatefulWidget {
  const SearchEventTextfield({
    super.key,
  });

  @override
  ConsumerState<SearchEventTextfield> createState() =>
      _SearchEventTextfieldState();
}

class _SearchEventTextfieldState extends ConsumerState<SearchEventTextfield> {
  TextEditingController controller = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        // Added delay so that focus request does not interfere with Hero animation.
        Future.delayed(const Duration(milliseconds: 300), () {
          FocusScope.of(context).requestFocus(focusNode);
        });
      },
    );

    controller.addListener(() {
      ref
          .read(searchEventViewModelProvider.notifier)
          .setSearchQuery(controller.text);
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: HeroTags.searchEventTextfield,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
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
                controller: controller,
                focusNode: focusNode,
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
    );
  }
}

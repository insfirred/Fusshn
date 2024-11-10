import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../select_location_view_model.dart';

class LocationSearchBox extends ConsumerStatefulWidget {
  const LocationSearchBox(
    this.isFirstLocationView, {
    super.key,
  });

  final bool isFirstLocationView;

  @override
  ConsumerState<LocationSearchBox> createState() => _LocationSearchBoxState();
}

class _LocationSearchBoxState extends ConsumerState<LocationSearchBox> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(
      () {
        ref
            .read(selectLocationViewModelProvider.notifier)
            .setSearchQuery(controller.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Select city of your choice',
          hintStyle: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(0.6),
          ),
          suffixIcon: IconButton(
            onPressed: () async {
              await ref
                  .read(selectLocationViewModelProvider.notifier)
                  .autoDetectLocation(context);

              if (!widget.isFirstLocationView) {
                context.maybePop();
              }
            },
            icon: const FaIcon(
              FontAwesomeIcons.locationCrosshairs,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

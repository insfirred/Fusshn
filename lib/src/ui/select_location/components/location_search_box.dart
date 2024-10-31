import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../select_location_view_model.dart';

class LocationSearchBox extends ConsumerStatefulWidget {
  const LocationSearchBox({
    super.key,
  });

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
      padding: const EdgeInsets.symmetric(horizontal: 14),
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
        ),
      ),
    );
  }
}

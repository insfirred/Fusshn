import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../edit_profile_view_model.dart';

class ImageSelectionOption extends ConsumerWidget {
  const ImageSelectionOption({
    super.key,
    required this.label,
    required this.imageSource,
  });

  final String label;
  final ImageSource imageSource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref
              .read(editProfileViewModelProvider.notifier)
              .pickImageAndUpload(imageSource);
          Navigator.pop(context);
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade700,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(label),
          ),
        ),
      ),
    );
  }
}

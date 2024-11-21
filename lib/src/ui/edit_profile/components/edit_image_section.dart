import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/hero_tags.dart';
import '../../../utils/bottom_sheet_util.dart';
import '../edit_profile_view_model.dart';
import 'image_selection_option.dart';

class EditImageSection extends ConsumerWidget {
  const EditImageSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(
      editProfileViewModelProvider.select((_) => _.imageUrl),
    );
    return GestureDetector(
      onTap: () {
        showFusshnBottomSheet(
          context: context,
          builder: (context) => Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Select your profile picture'),
                SizedBox(height: 30),
                Row(
                  children: [
                    ImageSelectionOption(
                      label: 'Camera',
                      imageSource: ImageSource.camera,
                    ),
                    SizedBox(width: 10),
                    ImageSelectionOption(
                      label: 'Gallery',
                      imageSource: ImageSource.gallery,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: HeroTags.userProfileImage,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                width: 100,
                height: 100,
                errorWidget: (context, url, d) => Image.asset(
                  'assets/no_user_image.png',
                  fit: BoxFit.cover,
                ),
                imageUrl: imageUrl ?? '',
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(value: progress.progress),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Change Profile Picture',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  color: const Color(0xFFC395FF),
                ),
          ),
        ],
      ),
    );
  }
}

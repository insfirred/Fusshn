import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/app_repository.dart';
import 'edit_profile_button.dart';

class UserDetails extends ConsumerWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(
      appRepositoryProvider.select((_) => _.userData!.name),
    );
    final email = ref.watch(
      appRepositoryProvider.select((_) => _.userData!.email),
    );
    final imageUrl = ref.watch(
      appRepositoryProvider.select((_) => _.userData!.imageUrl),
    );

    return Column(
      children: [
        Text(
          'Profile',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 35),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
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
        const SizedBox(height: 14),
        Column(
          children: [
            Text(
              name ?? 'username',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              email,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EditProfileButton(),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
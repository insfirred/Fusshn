import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/repositories/app_repository.dart';

class GreetingAppBar extends ConsumerWidget {
  const GreetingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCity = ref
        .watch(
          appRepositoryProvider.select((_) => _.currentPlacemarks),
        )?[0]
        .locality;

    final userName = ref.watch(
      appRepositoryProvider.select((_) => _.userData?.name),
    );

    return SliverAppBar(
      collapsedHeight: 85,
      toolbarHeight: 85,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 20),
          child: Image.asset(
            'assets/notification_read.png',
            width: 24,
          ),
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 34),
          Text(
            "Hi $userName",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                currentCity ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(width: 6),
              Image.asset(
                'assets/dropdown.png',
                width: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

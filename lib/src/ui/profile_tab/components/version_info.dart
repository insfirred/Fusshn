import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/repositories/app_repository.dart';

class VersionInfo extends ConsumerWidget {
  const VersionInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final versionNo = ref.watch(
      appRepositoryProvider.select((_) => _.currentAppVersion),
    );

    return Text(
      'v$versionNo',
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}

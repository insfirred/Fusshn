import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/ui/select_location/select_location_view.dart';

import '../../repositories/app_repository.dart';
import '../../routing/app_router.dart';

@RoutePage()
class SelectFirstLocationView extends ConsumerWidget {
  const SelectFirstLocationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      appRepositoryProvider,
      (previous, next) {
        if (next.userLocationData != null) {
          context.router.replace(const MainRoute());
        }
      },
    );

    return const SelectLocationView(isFirstLocationView: true);
  }
}

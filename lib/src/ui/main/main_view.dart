import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/routing/app_router.dart';

import '../../repositories/app_repository.dart';
import '../common_widgets/bottom_bar.dart';

@RoutePage()
class MainView extends ConsumerWidget {
  const MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appRepositoryProvider, (previous, next) {
      // navigate back to auth page, when user signs out
      if (next.status == AppStatus.unauthenticated) {
        context.replaceRoute(const AuthRoute());
      }
    });

    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        EventsRoute(),
        VenueRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => BottomBar(
        key: ValueKey(tabsRouter.activeIndex),
      ),
    );
  }
}

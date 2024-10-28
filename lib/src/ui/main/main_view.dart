import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/routing/app_router.dart';
import 'package:fusshn/src/ui/main/main_view_model.dart';
import 'package:geolocator/geolocator.dart';

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

      // for constantly listening changes in location service.
      if (previous?.locationServicePopupTrigger !=
              next.locationServicePopupTrigger &&
          !(next.isLocationServiceEnabled)) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
                'Please turn on the location service to see nearby events'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Geolocator.openLocationSettings();
                  Navigator.pop(context);
                },
                child: const Text('Enable Location'),
              ),
            ],
          ),
        );
      }

      // if (previous?.locationPermissionPopuptrigger !=
      //     next.locationPermissionPopuptrigger) {
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) => AlertDialog(
      //       title: const Text(
      //           'Location permission is turn off for this app, please give permission to see nearby events'),
      //       actions: [
      //         ElevatedButton(
      //           onPressed: () {
      //             Geolocator.openAppSettings();
      //             Navigator.pop(context);
      //           },
      //           child: const Text('Give Permission'),
      //         ),
      //       ],
      //     ),
      //   );
      // }
    });

    ref.listen(
      mainViewModelProvider,
      (previous, next) {
        log('hmmmmmmmmm');
        if (previous?.locationServicePopupTrigger !=
            next.locationServicePopupTrigger) {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text(
                  'Please turn on the location service to see nearby events'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Geolocator.openLocationSettings();
                    Navigator.pop(context);
                  },
                  child: const Text('Enable Location'),
                ),
              ],
            ),
          );
        }
      },
    );

    // log('havePermissions: ${ref.read(appRepositoryProvider).haveLocationPermission}');
    // log('have loc access: ${ref.read(appRepositoryProvider).isLocationServiceEnabled}');
    // log('pos: ${ref.read(appRepositoryProvider).currentPosition}');
    // log('placem: ${ref.read(appRepositoryProvider).currentPlacemarks}');

    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        EventsRoute(),
        // VenueRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => NewBottomBar(
        key: ValueKey(tabsRouter.activeIndex),
      ),
    );
  }
}

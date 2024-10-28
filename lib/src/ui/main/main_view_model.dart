import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/app_repository.dart';

part 'main_view_model.freezed.dart';

final mainViewModelProvider =
    StateNotifierProvider<MainViewModel, MainViewState>(
  (ref) => MainViewModel(
    ref: ref,
  ),
);

class MainViewModel extends StateNotifier<MainViewState> {
  final StateNotifierProviderRef ref;

  MainViewModel({
    required this.ref,
  }) : super(const MainViewState()) {
    () async {
      // added some time delay for a popup
      // it activated the listener on main view
      await Future.delayed(const Duration(seconds: 1));

      // listens to location service and sets in app repo
      if ((ref.read(appRepositoryProvider).isLocationServiceEnabled)) {
        // if location service is enabled,
        // then proceed further to ask location permission
        if ((ref.read(appRepositoryProvider).haveLocationPermission)) {
          // if have location permission,
          // then no worries.
          // DO NOTHING...
        } else {
          // if no location permission.
          // then ask to give permissions
          ref.read(appRepositoryProvider.notifier).getCurrentPosition();
          state = state.copyWith(
            locationServicePopupTrigger: state.locationServicePopupTrigger + 1,
          );
        }
      } else {
        // if location service is enabled,
        // then ask to enable it.
        state = state.copyWith(
          locationServicePopupTrigger: state.locationServicePopupTrigger + 1,
        );
      }
    }();
  }
}

@freezed
class MainViewState with _$MainViewState {
  const factory MainViewState({
    @Default(0) int locationServicePopupTrigger,
    @Default(0) int locationPermissionPopuptrigger,
  }) = _MainViewState;
}

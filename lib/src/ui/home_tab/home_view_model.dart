import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/models/event_data.dart';

import '../../services/firestore.dart';

part 'home_view_model.freezed.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeViewState>(
  (ref) => HomeViewModel(
    firestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class HomeViewModel extends StateNotifier<HomeViewState> {
  final FirebaseFirestore firestore;
  final AutoDisposeStateNotifierProviderRef ref;

  HomeViewModel({
    required this.firestore,
    required this.ref,
  }) : super(const HomeViewState()) {
    _fetchEventData();
    // _getCurrentPosition();
  }

  // Future<void> _getCurrentPosition() async {
  //   bool serviceEnabled;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   // Checking if the device location is ON or OFF.
  //   if (!serviceEnabled) {
  //     _showLocationServicePopup();
  //     return;
  //   }

  //   final hasPermission = await _handleLocationPermission();
  //   if (!hasPermission) {
  //     _showLocationPermissionPopup();
  //     // redirects user to app settings
  //   }

  //   await Geolocator.getCurrentPosition().then(
  //     (Position position) async {
  //       ref.read(appRepositoryProvider.notifier).setCurrentPosition(position);
  //       await placemarkFromCoordinates(
  //         position.latitude,
  //         position.longitude,
  //       ).then(
  //         (placemarks) {
  //           ref
  //               .read(appRepositoryProvider.notifier)
  //               .setCurrentPlacemarks(placemarks);
  //         },
  //       ).catchError((e) {
  //         debugPrint(e);
  //       });
  //     },
  //   ).catchError(
  //     (e) {
  //       debugPrint(e);
  //     },
  //   );
  // }

  // Future<bool> _handleLocationPermission() async {
  //   LocationPermission permission;

  //   // Checking whats the status of location permission...
  //   // return true if location access is there for this time else false.
  //   permission = await Geolocator.checkPermission();
  //   switch (permission) {
  //     case LocationPermission.always:
  //       return true;

  //     case LocationPermission.whileInUse:
  //       return true;

  //     case LocationPermission.denied:
  //       permission = await Geolocator.requestPermission();
  //       log(permission.toString());
  //       if (permission == LocationPermission.denied ||
  //           permission == LocationPermission.deniedForever ||
  //           permission == LocationPermission.unableToDetermine) {
  //         return false;
  //       }
  //       return true;

  //     case LocationPermission.deniedForever:
  //       return false;

  //     case LocationPermission.unableToDetermine:
  //       return false;
  //   }
  // }

  _fetchEventData() async {
    state = state.copyWith(status: HomeViewStatus.loading);
    var listSnapshot = await firestore.collection('events').get();

    List<EventData> events = listSnapshot.docs
        .map((eventSnapshot) => EventData.fromJson(eventSnapshot.data()))
        .toList();

    state = state.copyWith(events: events, status: HomeViewStatus.success);
  }

  void showPaymentSuccessPopup() => state = state.copyWith(
        paymentSuccessPopupTrigger: state.paymentSuccessPopupTrigger + 1,
      );

  void _showLocationServicePopup() => state = state.copyWith(
        locationServicePopupTrigger: state.locationServicePopupTrigger + 1,
      );

  void _showLocationPermissionPopup() => state = state.copyWith(
        locationPermissionPopuptrigger:
            state.locationPermissionPopuptrigger + 1,
      );
}

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default([]) List<EventData> events,
    // @Default([]) String selectedTag,
    @Default(0) int paymentSuccessPopupTrigger,
    @Default(0) int locationServicePopupTrigger,
    @Default(0) int locationPermissionPopuptrigger,
    @Default(HomeViewStatus.initial) HomeViewStatus status,
    String? errorMessage,
  }) = _HomeViewState;
}

enum HomeViewStatus {
  initial,
  loading,
  success,
  error,
}

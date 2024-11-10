// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/utils/snackbar_utils.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location/location.dart' as locationAlias;

import '../../common/hive_keys.dart';
import '../../common/indian_cities.dart';
import '../../models/location_data.dart';
import '../../repositories/app_repository.dart';
import '../../services/hive_service.dart';

part 'select_location_view_model.freezed.dart';

final selectLocationViewModelProvider = StateNotifierProvider.autoDispose<
    SelectLocationViewModel, SelectLocationViewState>(
  (ref) => SelectLocationViewModel(
    myLocationBox: ref.watch(hiveProvider).box(HiveKeys.myLocationDataBoxKey),
    ref: ref,
  ),
);

class SelectLocationViewModel extends StateNotifier<SelectLocationViewState> {
  SelectLocationViewModel({
    required this.myLocationBox,
    required this.ref,
  }) : super(const SelectLocationViewState()) {
    state = state.copyWith(allIndianCities: allIndianCities);
  }

  final Box<Map> myLocationBox;
  final AutoDisposeStateNotifierProviderRef ref;

  setSearchQuery(String val) {
    state = state.copyWith(searchQuery: val);
    _filterCities();
  }

  /// sets the user location data in local database (HIVE).
  setUserLocationInDbAndState({
    required String city,
    required String pincode,
    required double lat,
    required double lng,
  }) {
    var locationData = LocationData(
      city: city,
      pincode: pincode,
      lattitide: lat,
      longitude: lng,
    );

    myLocationBox.put(
      HiveKeys.lastLocationFieldKey,
      locationData.toJson(),
    );

    ref.read(appRepositoryProvider.notifier).setUserLocationData(locationData);
  }

  /// Auto detects user current location and stores in state
  Future<void> autoDetectLocation(context) async {
    locationAlias.Location location = locationAlias.Location();
    bool serviceEnabled = await location.serviceEnabled();

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // Checking if the device location is ON or OFF.
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    // checking if app has location accessing permisison.
    final hasLocationPermission = await _handleLocationPermission();
    if (!hasLocationPermission) {
      // ask user to manually give permissions to app.
      log('Give permission to app');
      showErrorMessage(
        context,
        'Location Access Denied, Give location permission to app in Setting -> Apps -> Fusshn -> Permissions -> Location',
      );
      return;
    }

    // app has location permissions
    // now proceeding to fetch user's current location.
    state = state.copyWith(status: SelectLocationViewStatus.LOCATION_FETCHING);
    await Geolocator.getCurrentPosition().then(
      (Position position) async {
        _setCurrentPosition(position);
        await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        ).then(
          (placemarks) {
            _setCurrentPlacemarks(placemarks);
            setUserLocationInDbAndState(
              city: placemarks.first.locality ?? 'city unavailable',
              pincode: placemarks.first.postalCode ?? '',
              lat: position.latitude,
              lng: position.longitude,
            );
          },
        ).catchError((e) {
          log(e);
        });
      },
    ).catchError(
      (e) {
        log(e.toString());
      },
    );

    state = state.copyWith(status: SelectLocationViewStatus.NO_FETCHING);
    log('${state.currentPlacemarks?.first}');
    log('${state.currentPosition}');
  }

  Future<bool> _handleLocationPermission() async {
    LocationPermission permission;

    // Checking whats the status of location permission...
    // return true if location access is there for this time else false.
    permission = await Geolocator.requestPermission();
    switch (permission) {
      case LocationPermission.always:
        return true;

      case LocationPermission.whileInUse:
        return true;

      case LocationPermission.denied:
        return false;

      case LocationPermission.deniedForever:
        return false;

      case LocationPermission.unableToDetermine:
        return false;
    }
  }

  /// Filter out cities based on [searchQuery]
  void _filterCities() {
    List<String> filteredList = allIndianCities;
    filteredList = filteredList
        .where(
          (city) =>
              city.toLowerCase().contains(state.searchQuery.toLowerCase()),
        )
        .toList();

    state = state.copyWith(allIndianCities: filteredList);
  }

  _setCurrentPlacemarks(List<Placemark>? val) => state = state.copyWith(
        currentPlacemarks: val,
      );

  _setCurrentPosition(Position? val) => state = state.copyWith(
        currentPosition: val,
      );
}

@freezed
class SelectLocationViewState with _$SelectLocationViewState {
  const factory SelectLocationViewState({
    @Default("") String searchQuery,
    @Default([]) List<String> allIndianCities,
    @Default(false) bool isLocationServiceEnabled,
    @Default(false) bool haveLocationPermission,
    List<Placemark>? currentPlacemarks,
    @Default(SelectLocationViewStatus.NO_FETCHING)
    SelectLocationViewStatus status,
    Position? currentPosition,
  }) = _SelectLocationViewState;
}

enum SelectLocationViewStatus {
  LOCATION_FETCHING,
  NO_FETCHING,
}

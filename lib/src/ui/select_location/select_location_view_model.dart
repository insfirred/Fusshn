import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/common/hive_keys.dart';
import 'package:fusshn/src/common/indian_cities.dart';
import 'package:fusshn/src/models/location_data.dart';
import 'package:fusshn/src/repositories/app_repository.dart';
import 'package:fusshn/src/services/hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  setUserLocation(String city) {
    var locationData = LocationData(
      city: city,
      pincode: '250110',
      lattitide: '0',
      longitude: '0',
    );

    myLocationBox.put(
      HiveKeys.lastLocationFieldKey,
      locationData.toJson(),
    );

    ref.read(appRepositoryProvider.notifier).setUserLocationData(locationData);
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
}

@freezed
class SelectLocationViewState with _$SelectLocationViewState {
  const factory SelectLocationViewState({
    @Default("") String searchQuery,
    @Default([]) List<String> allIndianCities,
  }) = _SelectLocationViewState;
}

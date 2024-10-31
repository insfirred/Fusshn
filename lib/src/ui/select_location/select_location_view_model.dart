import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/common/indian_cities.dart';

part 'select_location_view_model.freezed.dart';

final selectLocationViewModelProvider = StateNotifierProvider.autoDispose<
    SelectLocationViewModel, SelectLocationViewState>(
  (ref) => SelectLocationViewModel(),
);

class SelectLocationViewModel extends StateNotifier<SelectLocationViewState> {
  SelectLocationViewModel() : super(const SelectLocationViewState()) {
    state = state.copyWith(allIndianCities: allIndianCities);
  }

  setSearchQuery(String val) {
    state = state.copyWith(searchQuery: val);
    _filterCities();
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

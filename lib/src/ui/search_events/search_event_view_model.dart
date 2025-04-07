import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/event_data.dart';
import '../../services/firestore.dart';
import '../home_tab/home_view_model.dart';

part 'search_event_view_model.freezed.dart';

final searchEventViewModelProvider = StateNotifierProvider.autoDispose<
    SearchEventViewModel, SearchEventViewState>(
  (ref) => SearchEventViewModel(
    firestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class SearchEventViewModel extends StateNotifier<SearchEventViewState> {
  final FirebaseFirestore firestore;
  final Ref ref;

  SearchEventViewModel({
    required this.firestore,
    required this.ref,
  }) : super(SearchEventViewState(
            allEvents: ref.watch(homeViewModelProvider).allEvents)) {
    state = state.copyWith(filteredEvents: state.allEvents);
  }

  setSearchQuery(String val) {
    state = state.copyWith(searchQuery: val);
    _filterEvents();
  }

  /// Filter out events based on [searchQuery]
  void _filterEvents() {
    List<EventData> filteredList = state.allEvents.map((e) => e).toList();
    filteredList = filteredList
        .where(
          (city) =>
              city.name.toLowerCase().contains(state.searchQuery.toLowerCase()),
        )
        .toList();

    state = state.copyWith(filteredEvents: filteredList);
  }
}

@freezed
class SearchEventViewState with _$SearchEventViewState {
  const factory SearchEventViewState({
    @Default("") String searchQuery,
    required List<EventData> allEvents,
    @Default([]) List<EventData> filteredEvents,
  }) = _SearchEventViewState;
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/ui/home_tab/home_view_model.dart';

import '../../models/event_data.dart';
import '../../services/firestore.dart';

part 'event_view_model.freezed.dart';

final eventViewModelProvider =
    StateNotifierProvider.autoDispose<EventViewModel, EventViewState>(
  (ref) => EventViewModel(
    firestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class EventViewModel extends StateNotifier<EventViewState> {
  final FirebaseFirestore firestore;
  final AutoDisposeStateNotifierProviderRef ref;

  EventViewModel({
    required this.firestore,
    required this.ref,
  }) : super(
          EventViewState(
            events: ref.watch(homeViewModelProvider.select((_) => _.events)),
          ),
        ) {
    state = state.copyWith(filteredEvents: state.events);
  }

  setTagInFilter(String? tag) {
    state = state.copyWith(selectedTag: tag);
    _filterEvent();
  }

  _filterEvent() {
    if (state.selectedTag == null) {
      state = state.copyWith(filteredEvents: state.events);
      return;
    }

    // filtering according to tags
    List<EventData> filteredEvents = [];

    filteredEvents = state.events
        .where((event) => event.tags.contains(state.selectedTag))
        .toList();

    for (var element in filteredEvents) {
      log(element.name);
    }

    state = state.copyWith(filteredEvents: filteredEvents);
  }
}

@freezed
class EventViewState with _$EventViewState {
  const factory EventViewState({
    required List<EventData> events,
    @Default([]) List<EventData> filteredEvents,
    String? selectedTag,
    String? errorMessage,
  }) = _EventViewState;
}

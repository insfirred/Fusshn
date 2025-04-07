import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/common/app_constants.dart';
import 'package:fusshn/src/models/coordinates_data.dart';
import 'package:geolocator/geolocator.dart';

import '../../models/event_data.dart';
import '../../repositories/app_repository.dart';
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
    _fetchMyFeedbacks();
  }

  postUserFeedback(String feedback) async {
    final uid = ref.read(appRepositoryProvider).authUser!.uid;
    List<String> myFeedbacksList = [];
    for (var element in state.myFeedbacks) {
      myFeedbacksList.add(element);
    }

    myFeedbacksList.add(feedback);

    Map<String, dynamic> feedbackJson = {
      'myFeedbacks': myFeedbacksList,
    };
    await firestore.collection('user_feedbacks').doc(uid).set(feedbackJson);
    state = state.copyWith(
      showFeedbackCardOnHome: false,
      myFeedbacks: myFeedbacksList,
    );
  }

  _fetchMyFeedbacks() async {
    final uid = ref.read(appRepositoryProvider).authUser!.uid;
    var feedbackSnapshots =
        await firestore.collection('user_feedbacks').doc(uid).get();

    if (feedbackSnapshots.exists) {
      var feedbackJson = feedbackSnapshots.data();

      if (feedbackJson != null) {
        var list = feedbackJson['myFeedbacks'] as List;

        List<String> tempList = [];
        for (var element in list) {
          tempList.add(element as String);
        }

        state = state.copyWith(
          showFeedbackCardOnHome: false,
          myFeedbacks: tempList,
        );
      }
    } else {
      state = state.copyWith(showFeedbackCardOnHome: true);
    }
  }

  _fetchEventData() async {
    state = state.copyWith(status: HomeViewStatus.loading);
    var listSnapshot = await firestore.collection('events').get();

    List<EventData> nearByEvents = [];
    double userLattitude =
        ref.watch(appRepositoryProvider).userLocationData!.lattitide;
    double userLongitude =
        ref.watch(appRepositoryProvider).userLocationData!.longitude;

    List<EventData> events = listSnapshot.docs.map((eventSnapshot) {
      EventData event = EventData.fromJson(
        eventSnapshot.data(),
      );

      double eventLattitude = event.eventLocationCoordinates.lattitude;
      double eventLongitude = event.eventLocationCoordinates.longitude;

      final distanceInMeters = Geolocator.distanceBetween(
        userLattitude,
        userLongitude,
        eventLattitude,
        eventLongitude,
      );

      if (distanceInMeters <= AppConstants.nearByEventsWithinRadiusInMeters) {
        nearByEvents.add(event);
      }

      return event;
    }).toList();

    state = state.copyWith(
      allEvents: events,
      nearByEvents: nearByEvents,
      status: HomeViewStatus.success,
    );
  }

  void showPaymentSuccessPopup() => state = state.copyWith(
        paymentSuccessPopupTrigger: state.paymentSuccessPopupTrigger + 1,
      );

  void setTempRemoveFeedbackCard(bool val) => state = state.copyWith(
        tempRemoveFeedbackCard: val,
      );
}

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default([]) List<EventData> allEvents,
    @Default([]) List<EventData> nearByEvents,
    @Default(false) bool showFeedbackCardOnHome,
    @Default([]) List<String> myFeedbacks,
    @Default(0) int paymentSuccessPopupTrigger,
    @Default(false) bool tempRemoveFeedbackCard,
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

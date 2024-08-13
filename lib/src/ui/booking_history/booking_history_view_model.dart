import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/models/event_data.dart';
import 'package:fusshn/src/repositories/app_repository.dart';

import '../../models/booking.dart';
import '../../services/firestore.dart';

part 'booking_history_view_model.freezed.dart';

final bookingHistoryViewModelProvider = StateNotifierProvider.autoDispose<
    BookingHistoryViewModel, BookingHistoryViewState>(
  (ref) => BookingHistoryViewModel(
    firestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class BookingHistoryViewModel extends StateNotifier<BookingHistoryViewState> {
  final FirebaseFirestore firestore;
  final AutoDisposeStateNotifierProviderRef ref;

  BookingHistoryViewModel({
    required this.firestore,
    required this.ref,
  }) : super(const BookingHistoryViewState()) {
    _fetchBookings();
  }

  _fetchBookings() async {
    try {
      state = state.copyWith(status: BookingHistoryViewStatus.loading);
      List<String> myBookingsIds =
          ref.read(appRepositoryProvider).userData!.bookingIdsList ?? [];

      QuerySnapshot<Map<String, dynamic>> allBookingsSnapshot =
          await firestore.collection('bookings').get();

      List<QueryDocumentSnapshot<Map<String, dynamic>>> bookingsSnapshotList =
          allBookingsSnapshot.docs;

      List<Booking> myBookings = [];

      // filtering all my booking
      for (var snapshot in bookingsSnapshotList) {
        if (snapshot.exists) {
          Booking booking = Booking.fromJson(snapshot.data());
          if (myBookingsIds.contains(booking.id)) {
            myBookings.add(booking);
          }
        }
      }

      // getting all booked event data
      QuerySnapshot<Map<String, dynamic>> allEventsSnapshot =
          await firestore.collection('events').get();

      List<QueryDocumentSnapshot<Map<String, dynamic>>> eventSnapshotList =
          allEventsSnapshot.docs;

      Map<String, EventData> myBookedEvents = {};

      for (var eventSnapshot in eventSnapshotList) {
        if (eventSnapshot.exists) {
          EventData event = EventData.fromJson(eventSnapshot.data());
          for (var myBooking in myBookings) {
            if (myBooking.eventId == event.id) {
              myBookedEvents[myBooking.id] = event;
            }
          }
        }
      }

      // eventSnapshotList.forEach(
      //   (eventSnapshot) async {
      //     if (eventSnapshot.exists) {
      //       EventData event = EventData.fromJson(eventSnapshot.data());
      //       for (var myBooking in state.myBookings) {
      //         if (myBooking.eventId == event.id) {
      //           myBookedEvents[myBooking.id] = event;
      //         }
      //       }
      //     }
      //   },
      // );

      state = state.copyWith(
        status: BookingHistoryViewStatus.success,
        myBookings: myBookings,
        eventData: myBookedEvents,
      );
    } catch (e) {
      print(e);
    }
  }
}

@freezed
class BookingHistoryViewState with _$BookingHistoryViewState {
  const factory BookingHistoryViewState({
    @Default([]) List<Booking> myBookings,
    Map<String, EventData>? eventData,
    @Default(BookingHistoryViewStatus.initial) BookingHistoryViewStatus status,
    String? errorMessage,
  }) = _BookingHistoryViewState;
}

enum BookingHistoryViewStatus {
  initial,
  loading,
  success,
  error,
}

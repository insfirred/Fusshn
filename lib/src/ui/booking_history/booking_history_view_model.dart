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
  final Ref ref;

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

      QuerySnapshot<Map<String, dynamic>> allBookingsSnapshot = await firestore
          .collection('bookings')
          .orderBy('createdAt', descending: true)
          .get();

      List<QueryDocumentSnapshot<Map<String, dynamic>>> bookingsSnapshotList =
          allBookingsSnapshot.docs;

      List<Booking> myAllBookings = [];
      List<Booking> upcomingBookings = [];
      List<Booking> pastBookings = [];

      // filtering all my booking
      for (var snapshot in bookingsSnapshotList) {
        if (snapshot.exists) {
          Booking booking = Booking.fromJson(snapshot.data());
          if (myBookingsIds.contains(booking.id)) {
            myAllBookings.add(booking);
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
          for (var myBooking in myAllBookings) {
            if (myBooking.eventId == event.id) {
              myBookedEvents[myBooking.id] = event;
              var now = DateTime.now();

              // it event already happened (event is in past) => true
              // else => false
              bool isEventHappend = now.isAfter(event.endTime);

              if (!myBooking.isCheckIn && !isEventHappend) {
                upcomingBookings.add(myBooking);
              } else {
                pastBookings.add(myBooking);
              }
            }
          }
        }
      }

      state = state.copyWith(
        status: BookingHistoryViewStatus.success,
        upcomingBookings: upcomingBookings,
        pastBookings: pastBookings,
        eventData: myBookedEvents,
      );
    } catch (e) {
      print(e);
    }
  }

  setViewType(BookingHistoryViewType viewType) =>
      state = state.copyWith(viewType: viewType);
}

@freezed
class BookingHistoryViewState with _$BookingHistoryViewState {
  const factory BookingHistoryViewState({
    @Default([]) List<Booking> upcomingBookings,
    @Default([]) List<Booking> pastBookings,

    // <BookindID, EventData>
    Map<String, EventData>? eventData,
    @Default(BookingHistoryViewType.UPCOMING) BookingHistoryViewType viewType,
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

enum BookingHistoryViewType {
  UPCOMING,
  PAST_EVENTS,
}

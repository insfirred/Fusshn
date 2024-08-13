import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/models/event_data.dart';
import 'package:fusshn/src/models/user_data.dart';
import 'package:fusshn/src/services/firestore.dart';
import 'package:fusshn/src/services/razorpay_service.dart';
import 'package:fusshn/src/ui/book_ticket_sheet/book_ticket_sheet_view_model.dart';
import 'package:fusshn/src/utils/razorpay_checkout_options.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../common/payment.dart';
import '../../models/booking.dart';
import '../../models/ticket_type.dart';
import '../../repositories/app_repository.dart';

part 'confirm_booking_view_model.freezed.dart';

final confirmBookingViewModelProvider = StateNotifierProvider.autoDispose<
    ConfirmBookingViewModel, ConfirmBookingState>(
  (ref) => ConfirmBookingViewModel(
    ref: ref,
    razorpay: ref.watch(razorProvider),
    firestore: ref.watch(firestoreProvider),
  ),
);

class ConfirmBookingViewModel extends StateNotifier<ConfirmBookingState> {
  final AutoDisposeStateNotifierProviderRef ref;
  final Razorpay razorpay;
  final FirebaseFirestore firestore;

  ConfirmBookingViewModel({
    required this.ref,
    required this.razorpay,
    required this.firestore,
  }) : super(ConfirmBookingState(
          selectedTicketCount:
              ref.read(bookTicketSheetViewModelProvider).selectedTicketCount,
          selectedTicketType:
              ref.read(bookTicketSheetViewModelProvider).selectedTicketType,
          eventId: ref.read(bookTicketSheetViewModelProvider).eventId,
        )) {
    _calculateTotalPrice();
  }

  setIsTermsAccepted(bool val) => state = state.copyWith(
        isTermsAccepted: val,
      );

  openCheckout() {
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWalletSelected);

    Map<String, dynamic> options = getTestCheckoutOptions(
      amount: state.grandTotalPrice * 100,
      description:
          '${state.selectedTicketCount} X "${state.selectedTicketType!.description}"',
      prefill: {
        'name': ref.read(appRepositoryProvider).userData?.name ?? 'User',
        'contact':
            ref.read(appRepositoryProvider).userData?.phone ?? '8888888888',
        'email': ref.read(appRepositoryProvider).userData?.email,
      },
    );

    razorpay.open(options);
  }

  void _handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    await _updateAvailableTickets();
    await _createBookingData(response.paymentId ?? '');
    await ref.read(appRepositoryProvider.notifier).refreshUserData();

    state = state.copyWith(
      status: PaymentStatus.success,
      paymentSuccessResponse: response,
    );
    print('Payment Successful: Payment ID: ${response.paymentId}');
    print(state.paymentSuccessResponse);
  }

  void _handlePaymentErrorResponse(PaymentFailureResponse response) {
    state = state.copyWith(
      status: PaymentStatus.failure,
      paymentFailureResponse: response,
    );
    print(
      'Payment Failed Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}',
    );
  }

  void _handleExternalWalletSelected(ExternalWalletResponse response) {
    print('External Wallet Selected: ${response.walletName}');
  }

  _calculateTotalPrice() {
    state = state.copyWith(
      selectedTicketCount: state.selectedTicketCount,
      selectedTicketType: state.selectedTicketType,
    );

    _setBasePrice();
    _setGstFee();
    _setBookingFee();

    state = state.copyWith(
      grandTotalPrice: _roundOffUptoTwoDecimal(
          state.basePrice + state.bookingFee + state.gstFee),
    );
  }

  _setBasePrice() => state = state.copyWith(
      basePrice: _roundOffUptoTwoDecimal(
          state.selectedTicketType!.price * state.selectedTicketCount));

  _setGstFee() => state = state.copyWith(
      gstFee: _roundOffUptoTwoDecimal(state.basePrice / 100 * gstFeePercent));

  _setBookingFee() => state = state.copyWith(
      bookingFee: _roundOffUptoTwoDecimal(
          state.basePrice / 100 * defaultBookingFeePercent));

  double _roundOffUptoTwoDecimal(double val) {
    String inString = val.toStringAsFixed(2);
    return double.parse(inString);
  }

  _updateAvailableTickets() async {
    DocumentReference<Map<String, dynamic>> eventRef =
        firestore.collection('events').doc(state.eventId);

    DocumentSnapshot<Map<String, dynamic>> eventSnapshot = await eventRef.get();

    List<TicketType> tickets =
        EventData.fromJson(eventSnapshot.data()!).tickets;

    List<TicketType> updatedTickets = tickets.map(
      (ticket) {
        if (ticket.id == state.selectedTicketType!.id) {
          TicketType newTicket = TicketType(
            id: ticket.id,
            name: ticket.name,
            price: ticket.price,
            personAllowed: ticket.personAllowed,
            personGender: ticket.personGender,
            description: ticket.description,
            isRefundable: ticket.isRefundable,
            totalTickets: ticket.totalTickets,
            availableTickets:
                ticket.availableTickets - state.selectedTicketCount,
          );
          return newTicket;
        }

        return ticket;
      },
    ).toList();

    await eventRef.update({
      'tickets': updatedTickets.map((e) => e.toJson()).toList(),
    });
  }

  // TODO: Make it a Transaction method
  _createBookingData(String paymentId) async {
    String bookingId = '';
    Booking newBooking = Booking(
      id: bookingId,
      paymentId: paymentId,
      eventId: state.eventId,
      ticketType: state.selectedTicketType!,
      ticketCount: state.selectedTicketCount,
      createdAt: DateTime.now(),
    );

    // booking added to booking collection...

    await firestore.collection('bookings').add(newBooking.toJson()).then(
      (docRef) {
        bookingId = docRef.id;
        docRef.update({'id': bookingId});
      },
    );

    // updating user doc with new created booking.
    List<String> oldBookingIdsList =
        ref.read(appRepositoryProvider).userData!.bookingIdsList ?? [];

    newBooking = Booking(
      id: bookingId,
      paymentId: paymentId,
      eventId: state.eventId,
      ticketType: state.selectedTicketType!,
      ticketCount: state.selectedTicketCount,
      createdAt: DateTime.now(),
    );

    List<String> updatedBooking = [];
    for (var e in oldBookingIdsList) {
      updatedBooking.add(e);
    }
    updatedBooking.add(bookingId);

    await firestore
        .collection('users')
        .doc(ref.read(appRepositoryProvider).userData!.uid)
        .update({
      'bookingIdsList': updatedBooking,
    });
  }
}

@freezed
class ConfirmBookingState with _$ConfirmBookingState {
  const factory ConfirmBookingState({
    required TicketType? selectedTicketType,
    required int selectedTicketCount,
    required String eventId,
    @Default(0) double basePrice,
    @Default(0) double bookingFee,
    @Default(0) double gstFee,
    @Default(0) double grandTotalPrice,
    @Default(false) bool isTermsAccepted,
    @Default(PaymentStatus.initial) PaymentStatus status,
    PaymentFailureResponse? paymentFailureResponse,
    PaymentSuccessResponse? paymentSuccessResponse,
    String? errorMessage,
  }) = _ConfirmBookingState;
}

enum PaymentStatus {
  initial,
  success,
  failure,
}

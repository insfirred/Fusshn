import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../common/payment.dart';
import '../../models/booking.dart';
import '../../models/event_data.dart';
import '../../models/ticket_type.dart';
import '../../repositories/app_repository.dart';
import '../../services/firestore.dart';
import '../../services/razorpay_service.dart';
import '../../utils/razorpay_checkout_options.dart';
import '../book_ticket_sheet/book_ticket_sheet_view_model.dart';

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
  final Ref ref;
  final Razorpay razorpay;
  final FirebaseFirestore firestore;

  ConfirmBookingViewModel({
    required this.ref,
    required this.razorpay,
    required this.firestore,
  }) : super(
          ConfirmBookingState(
            selectedTicketCount:
                ref.read(bookTicketSheetViewModelProvider).selectedTicketCount,
            selectedTicketType:
                ref.read(bookTicketSheetViewModelProvider).selectedTicketType,
            eventId: ref.read(bookTicketSheetViewModelProvider).eventId,
          ),
        ) {
    log('helllllooo');
    log('${state.selectedTicketCount}');
    log(state.selectedTicketType?.name ?? 'null hai');
    _calculateTotalPrice();
  }

  setIsTermsAccepted(bool val) => state = state.copyWith(
        status: PaymentStatus.initial,
        isTermsAccepted: val,
      );

  openCheckout() {
    state = state.copyWith(status: PaymentStatus.initial);

    if (!state.isTermsAccepted) {
      state = state.copyWith(
          status: PaymentStatus.failure,
          errorMessage: 'Please accept the terms and conditions to proceed.');

      return;
    }

    state = state.copyWith(status: PaymentStatus.loading);

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
    /*
    When Payment Success, we will perform the following.
      1. Update Tickets count in db
      2. Create Booking Data in db
      3. Refresh (fetch again) User Data
      4. set the state of confirmBookingViewModelProvider.
     */

    // here we are updating the ticket count and createing booking data in the customer app itself.
    // Bad approach, shouldn't be used, switch to server side code later.

    // 1. Update Tickets count in db
    _updateAvailableTickets();

    // api req to update ticket in db.
    // await _updateAvailableTicketsApiReq();

    // For testing purpose. DELETE this function later {NO-USE}
    // await _initRouteRequest();

    // 2. Create Booking Data in db
    await _createBookingData(response.paymentId ?? '');

    // 3. Refresh (fetch again) User Data
    await ref.read(appRepositoryProvider.notifier).refreshUserData();

    // 4. set the state of confirmBookingViewModelProvider.
    state = state.copyWith(
      status: PaymentStatus.success,
      paymentSuccessResponse: response,
    );
    print('Payment Successful: Payment ID: ${response.paymentId}');
    print(state.paymentSuccessResponse);
  }

  void _handlePaymentErrorResponse(PaymentFailureResponse response) {
    state = state.copyWith(
      errorMessage: '${response.message}. Error code: ${response.code}',
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
    _setBookingFee();
    _setGstFee();

    log('${state.basePrice} + ${state.bookingFee} + ${state.gstFee}');

    state = state.copyWith(
      grandTotalPrice: _roundOffUptoTwoDecimal(
        state.basePrice + state.bookingFee + state.gstFee,
      ),
    );
  }

  _setBasePrice() => state = state.copyWith(
          basePrice: _roundOffUptoTwoDecimal(
        state.selectedTicketType!.price * state.selectedTicketCount,
      ));

  _setBookingFee() => state = state.copyWith(
          bookingFee: _roundOffUptoTwoDecimal(
        state.basePrice / 100 * defaultBookingFeePercent,
      ));

  _setGstFee() => state = state.copyWith(
          gstFee: _roundOffUptoTwoDecimal(
        state.bookingFee / 100 * gstFeePercent,
      ));

  double _roundOffUptoTwoDecimal(double val) {
    String inString = val.toStringAsFixed(2);
    return double.parse(inString);
  }

  /// For testing purpose. DELETE this function later {NO-USE}
  // _initRouteRequest() async {
  //   final currentAuthUser = ref.read(appRepositoryProvider).authUser;
  //   String idToken = await currentAuthUser?.getIdToken() ?? '';

  //   String baseUrl = 'fusshn-server.onrender.com';

  //   var url = Uri.https(baseUrl);
  //   print(
  //       'sending http get req..... at LOCAL HOST 3000//////////////////////////////');

  //   var response = await http.get(
  //     url,
  //     // headers: <String, String>{
  //     //   "Authorization": "Bearer $idToken",
  //     // },
  //   );

  //   print('STATUSCODEEEEEEEEEEE:${response.statusCode}.......................');
  //   print(response.body);
  // }

  // here we are updating the tickets in the customer app itself.
  // Bad approach, shouldn't be used, switch to server side code later.
  _updateAvailableTickets() async {
    try {
      DocumentReference<Map<String, dynamic>> eventRef =
          firestore.collection('events').doc(state.eventId);

      log('hellooooo');
      DocumentSnapshot<Map<String, dynamic>> eventSnapshot =
          await eventRef.get();
      log('hellooooo2');

      log('eventData: ${eventSnapshot.exists}');

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
    } catch (e) {
      log('error in _updateAvailableTickets(): $e');
    }
  }

  // _updateAvailableTicketsApiReq() async {
  //   final currentAuthUser = ref.read(appRepositoryProvider).authUser;
  //   String idToken = await currentAuthUser?.getIdToken() ?? '';

  //   String baseUrl = 'fusshn-server.onrender.com';
  //   String endPoint = '/update-ticket-count';

  //   var url = Uri.https(baseUrl, endPoint);
  //   print('sending http post req.....');
  //   var response = await http.post(
  //     url,
  //     headers: <String, String>{
  //       "Authorization": "Bearer $idToken",
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode({
  //       "eventId": state.eventId,
  //       "ticketId": state.selectedTicketType!.id,
  //       "selectedTicketCount": state.selectedTicketCount,
  //     }),
  //   );

  //   print('STATUSCODEEEEEEEEEEE:${response.statusCode}.......................');

  //   switch (response.statusCode) {
  //     case 200:
  //       break;
  //     case 400:
  //       state = state.copyWith(
  //         status: PaymentStatus.failure,
  //         errorMessage:
  //             'Error 400, Invalid req body (eventId, selectedTicketType, newTicketCount)',
  //       );
  //       break;
  //     default:
  //       state = state.copyWith(
  //         status: PaymentStatus.failure,
  //         errorMessage: 'Something went wrong in servers!!!',
  //       );
  //   }
  // }

  // TODO: Make it a Transaction method
  _createBookingData(String paymentId) async {
    String userId = ref.read(appRepositoryProvider).userData!.uid;
    String userName = ref.read(appRepositoryProvider).userData!.name!;
    String userEmail = ref.read(appRepositoryProvider).userData!.email;
    String userPhone = ref.read(appRepositoryProvider).userData!.phone!;

    String bookingId = "";

    Booking booking = Booking(
      id: bookingId,
      paymentId: paymentId,
      eventId: state.eventId,
      ticketType: state.selectedTicketType!,
      ticketCount: state.selectedTicketCount,
      createdAt: DateTime.now(),
      userId: userId,
    );

    Map<String, dynamic> newBookingJson = booking.toJson();
    newBookingJson.addAll(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userPhone": userPhone,
      },
    );

    // booking added to booking collection...
    await firestore.collection('bookings').add(newBookingJson).then((doc) {
      bookingId = doc.id;
      doc.update({
        "id": doc.id,
      });
    });

    // updating user doc with new created booking.
    List<String> oldBookingIdsList =
        ref.read(appRepositoryProvider).userData!.bookingIdsList ?? [];

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
  loading,
  failure,
}

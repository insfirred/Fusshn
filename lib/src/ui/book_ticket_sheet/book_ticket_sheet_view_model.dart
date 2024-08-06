import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/common/payment.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../models/ticket_type.dart';

part 'book_ticket_sheet_view_model.freezed.dart';

final bookTicketSheetViewModelProvider = StateNotifierProvider.autoDispose<
    BookTicketSheetViewModel, BookTicketSheetViewState>(
  (ref) => BookTicketSheetViewModel(
    ref: ref,
  ),
);

class BookTicketSheetViewModel extends StateNotifier<BookTicketSheetViewState> {
  final StateNotifierProviderRef ref;

  BookTicketSheetViewModel({
    required this.ref,
  }) : super(const BookTicketSheetViewState());

  setTicketType(TicketType? type) => state = state.copyWith(
        selectedTicketType: type,
        selectedTicketCount: 0,
      );

  setTicketCount(int count) =>
      state = state.copyWith(selectedTicketCount: count);

  calculateTotalPrice() {
    _setBasePrice();
    _setGstFee();
    _setBookingFee();

    state = state.copyWith(
      grandTotalPrice: state.basePrice + state.bookingFee + state.gstFee,
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    state = state.copyWith(status: PaymentStatus.failure);
    print(
      'Payment Failed Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}',
    );
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    state = state.copyWith(status: PaymentStatus.success);
    print('Payment Successful: Payment ID: ${response.paymentId}');
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    print('External Wallet Selected: ${response.walletName}');
  }

  _setBasePrice() => state = state.copyWith(
      basePrice: state.selectedTicketType!.price * state.selectedTicketCount);

  _setGstFee() =>
      state = state.copyWith(gstFee: state.basePrice / 100 * gstFeePercent);

  _setBookingFee() => state = state.copyWith(
      bookingFee: state.basePrice / 100 * defaultBookingFeePercent);
}

@freezed
class BookTicketSheetViewState with _$BookTicketSheetViewState {
  const factory BookTicketSheetViewState({
    TicketType? selectedTicketType,
    @Default(0) int selectedTicketCount,
    @Default(0) double basePrice,
    @Default(0) double bookingFee,
    @Default(0) double gstFee,
    @Default(0) double grandTotalPrice,
    @Default(PaymentStatus.initial) PaymentStatus status,
    String? error,
  }) = _BookTicketSheetViewState;
}

enum PaymentStatus {
  initial,
  success,
  failure,
}

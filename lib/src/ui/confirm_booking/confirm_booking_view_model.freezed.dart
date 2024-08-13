// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_booking_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfirmBookingState {
  TicketType? get selectedTicketType => throw _privateConstructorUsedError;
  int get selectedTicketCount => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  double get basePrice => throw _privateConstructorUsedError;
  double get bookingFee => throw _privateConstructorUsedError;
  double get gstFee => throw _privateConstructorUsedError;
  double get grandTotalPrice => throw _privateConstructorUsedError;
  bool get isTermsAccepted => throw _privateConstructorUsedError;
  PaymentStatus get status => throw _privateConstructorUsedError;
  PaymentFailureResponse? get paymentFailureResponse =>
      throw _privateConstructorUsedError;
  PaymentSuccessResponse? get paymentSuccessResponse =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfirmBookingStateCopyWith<ConfirmBookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmBookingStateCopyWith<$Res> {
  factory $ConfirmBookingStateCopyWith(
          ConfirmBookingState value, $Res Function(ConfirmBookingState) then) =
      _$ConfirmBookingStateCopyWithImpl<$Res, ConfirmBookingState>;
  @useResult
  $Res call(
      {TicketType? selectedTicketType,
      int selectedTicketCount,
      String eventId,
      double basePrice,
      double bookingFee,
      double gstFee,
      double grandTotalPrice,
      bool isTermsAccepted,
      PaymentStatus status,
      PaymentFailureResponse? paymentFailureResponse,
      PaymentSuccessResponse? paymentSuccessResponse,
      String? errorMessage});
}

/// @nodoc
class _$ConfirmBookingStateCopyWithImpl<$Res, $Val extends ConfirmBookingState>
    implements $ConfirmBookingStateCopyWith<$Res> {
  _$ConfirmBookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTicketType = freezed,
    Object? selectedTicketCount = null,
    Object? eventId = null,
    Object? basePrice = null,
    Object? bookingFee = null,
    Object? gstFee = null,
    Object? grandTotalPrice = null,
    Object? isTermsAccepted = null,
    Object? status = null,
    Object? paymentFailureResponse = freezed,
    Object? paymentSuccessResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      selectedTicketType: freezed == selectedTicketType
          ? _value.selectedTicketType
          : selectedTicketType // ignore: cast_nullable_to_non_nullable
              as TicketType?,
      selectedTicketCount: null == selectedTicketCount
          ? _value.selectedTicketCount
          : selectedTicketCount // ignore: cast_nullable_to_non_nullable
              as int,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      bookingFee: null == bookingFee
          ? _value.bookingFee
          : bookingFee // ignore: cast_nullable_to_non_nullable
              as double,
      gstFee: null == gstFee
          ? _value.gstFee
          : gstFee // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotalPrice: null == grandTotalPrice
          ? _value.grandTotalPrice
          : grandTotalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isTermsAccepted: null == isTermsAccepted
          ? _value.isTermsAccepted
          : isTermsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentFailureResponse: freezed == paymentFailureResponse
          ? _value.paymentFailureResponse
          : paymentFailureResponse // ignore: cast_nullable_to_non_nullable
              as PaymentFailureResponse?,
      paymentSuccessResponse: freezed == paymentSuccessResponse
          ? _value.paymentSuccessResponse
          : paymentSuccessResponse // ignore: cast_nullable_to_non_nullable
              as PaymentSuccessResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfirmBookingStateImplCopyWith<$Res>
    implements $ConfirmBookingStateCopyWith<$Res> {
  factory _$$ConfirmBookingStateImplCopyWith(_$ConfirmBookingStateImpl value,
          $Res Function(_$ConfirmBookingStateImpl) then) =
      __$$ConfirmBookingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TicketType? selectedTicketType,
      int selectedTicketCount,
      String eventId,
      double basePrice,
      double bookingFee,
      double gstFee,
      double grandTotalPrice,
      bool isTermsAccepted,
      PaymentStatus status,
      PaymentFailureResponse? paymentFailureResponse,
      PaymentSuccessResponse? paymentSuccessResponse,
      String? errorMessage});
}

/// @nodoc
class __$$ConfirmBookingStateImplCopyWithImpl<$Res>
    extends _$ConfirmBookingStateCopyWithImpl<$Res, _$ConfirmBookingStateImpl>
    implements _$$ConfirmBookingStateImplCopyWith<$Res> {
  __$$ConfirmBookingStateImplCopyWithImpl(_$ConfirmBookingStateImpl _value,
      $Res Function(_$ConfirmBookingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTicketType = freezed,
    Object? selectedTicketCount = null,
    Object? eventId = null,
    Object? basePrice = null,
    Object? bookingFee = null,
    Object? gstFee = null,
    Object? grandTotalPrice = null,
    Object? isTermsAccepted = null,
    Object? status = null,
    Object? paymentFailureResponse = freezed,
    Object? paymentSuccessResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ConfirmBookingStateImpl(
      selectedTicketType: freezed == selectedTicketType
          ? _value.selectedTicketType
          : selectedTicketType // ignore: cast_nullable_to_non_nullable
              as TicketType?,
      selectedTicketCount: null == selectedTicketCount
          ? _value.selectedTicketCount
          : selectedTicketCount // ignore: cast_nullable_to_non_nullable
              as int,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      bookingFee: null == bookingFee
          ? _value.bookingFee
          : bookingFee // ignore: cast_nullable_to_non_nullable
              as double,
      gstFee: null == gstFee
          ? _value.gstFee
          : gstFee // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotalPrice: null == grandTotalPrice
          ? _value.grandTotalPrice
          : grandTotalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isTermsAccepted: null == isTermsAccepted
          ? _value.isTermsAccepted
          : isTermsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentFailureResponse: freezed == paymentFailureResponse
          ? _value.paymentFailureResponse
          : paymentFailureResponse // ignore: cast_nullable_to_non_nullable
              as PaymentFailureResponse?,
      paymentSuccessResponse: freezed == paymentSuccessResponse
          ? _value.paymentSuccessResponse
          : paymentSuccessResponse // ignore: cast_nullable_to_non_nullable
              as PaymentSuccessResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConfirmBookingStateImpl implements _ConfirmBookingState {
  const _$ConfirmBookingStateImpl(
      {required this.selectedTicketType,
      required this.selectedTicketCount,
      required this.eventId,
      this.basePrice = 0,
      this.bookingFee = 0,
      this.gstFee = 0,
      this.grandTotalPrice = 0,
      this.isTermsAccepted = false,
      this.status = PaymentStatus.initial,
      this.paymentFailureResponse,
      this.paymentSuccessResponse,
      this.errorMessage});

  @override
  final TicketType? selectedTicketType;
  @override
  final int selectedTicketCount;
  @override
  final String eventId;
  @override
  @JsonKey()
  final double basePrice;
  @override
  @JsonKey()
  final double bookingFee;
  @override
  @JsonKey()
  final double gstFee;
  @override
  @JsonKey()
  final double grandTotalPrice;
  @override
  @JsonKey()
  final bool isTermsAccepted;
  @override
  @JsonKey()
  final PaymentStatus status;
  @override
  final PaymentFailureResponse? paymentFailureResponse;
  @override
  final PaymentSuccessResponse? paymentSuccessResponse;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ConfirmBookingState(selectedTicketType: $selectedTicketType, selectedTicketCount: $selectedTicketCount, eventId: $eventId, basePrice: $basePrice, bookingFee: $bookingFee, gstFee: $gstFee, grandTotalPrice: $grandTotalPrice, isTermsAccepted: $isTermsAccepted, status: $status, paymentFailureResponse: $paymentFailureResponse, paymentSuccessResponse: $paymentSuccessResponse, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmBookingStateImpl &&
            (identical(other.selectedTicketType, selectedTicketType) ||
                other.selectedTicketType == selectedTicketType) &&
            (identical(other.selectedTicketCount, selectedTicketCount) ||
                other.selectedTicketCount == selectedTicketCount) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.bookingFee, bookingFee) ||
                other.bookingFee == bookingFee) &&
            (identical(other.gstFee, gstFee) || other.gstFee == gstFee) &&
            (identical(other.grandTotalPrice, grandTotalPrice) ||
                other.grandTotalPrice == grandTotalPrice) &&
            (identical(other.isTermsAccepted, isTermsAccepted) ||
                other.isTermsAccepted == isTermsAccepted) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentFailureResponse, paymentFailureResponse) ||
                other.paymentFailureResponse == paymentFailureResponse) &&
            (identical(other.paymentSuccessResponse, paymentSuccessResponse) ||
                other.paymentSuccessResponse == paymentSuccessResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedTicketType,
      selectedTicketCount,
      eventId,
      basePrice,
      bookingFee,
      gstFee,
      grandTotalPrice,
      isTermsAccepted,
      status,
      paymentFailureResponse,
      paymentSuccessResponse,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmBookingStateImplCopyWith<_$ConfirmBookingStateImpl> get copyWith =>
      __$$ConfirmBookingStateImplCopyWithImpl<_$ConfirmBookingStateImpl>(
          this, _$identity);
}

abstract class _ConfirmBookingState implements ConfirmBookingState {
  const factory _ConfirmBookingState(
      {required final TicketType? selectedTicketType,
      required final int selectedTicketCount,
      required final String eventId,
      final double basePrice,
      final double bookingFee,
      final double gstFee,
      final double grandTotalPrice,
      final bool isTermsAccepted,
      final PaymentStatus status,
      final PaymentFailureResponse? paymentFailureResponse,
      final PaymentSuccessResponse? paymentSuccessResponse,
      final String? errorMessage}) = _$ConfirmBookingStateImpl;

  @override
  TicketType? get selectedTicketType;
  @override
  int get selectedTicketCount;
  @override
  String get eventId;
  @override
  double get basePrice;
  @override
  double get bookingFee;
  @override
  double get gstFee;
  @override
  double get grandTotalPrice;
  @override
  bool get isTermsAccepted;
  @override
  PaymentStatus get status;
  @override
  PaymentFailureResponse? get paymentFailureResponse;
  @override
  PaymentSuccessResponse? get paymentSuccessResponse;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ConfirmBookingStateImplCopyWith<_$ConfirmBookingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

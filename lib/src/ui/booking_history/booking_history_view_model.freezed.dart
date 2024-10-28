// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_history_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingHistoryViewState {
  List<Booking> get myBookings =>
      throw _privateConstructorUsedError; // <BookindID, EventData>
  Map<String, EventData>? get eventData => throw _privateConstructorUsedError;
  BookingHistoryViewType get viewType => throw _privateConstructorUsedError;
  BookingHistoryViewStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingHistoryViewStateCopyWith<BookingHistoryViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingHistoryViewStateCopyWith<$Res> {
  factory $BookingHistoryViewStateCopyWith(BookingHistoryViewState value,
          $Res Function(BookingHistoryViewState) then) =
      _$BookingHistoryViewStateCopyWithImpl<$Res, BookingHistoryViewState>;
  @useResult
  $Res call(
      {List<Booking> myBookings,
      Map<String, EventData>? eventData,
      BookingHistoryViewType viewType,
      BookingHistoryViewStatus status,
      String? errorMessage});
}

/// @nodoc
class _$BookingHistoryViewStateCopyWithImpl<$Res,
        $Val extends BookingHistoryViewState>
    implements $BookingHistoryViewStateCopyWith<$Res> {
  _$BookingHistoryViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myBookings = null,
    Object? eventData = freezed,
    Object? viewType = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      myBookings: null == myBookings
          ? _value.myBookings
          : myBookings // ignore: cast_nullable_to_non_nullable
              as List<Booking>,
      eventData: freezed == eventData
          ? _value.eventData
          : eventData // ignore: cast_nullable_to_non_nullable
              as Map<String, EventData>?,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as BookingHistoryViewType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingHistoryViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingHistoryViewStateImplCopyWith<$Res>
    implements $BookingHistoryViewStateCopyWith<$Res> {
  factory _$$BookingHistoryViewStateImplCopyWith(
          _$BookingHistoryViewStateImpl value,
          $Res Function(_$BookingHistoryViewStateImpl) then) =
      __$$BookingHistoryViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Booking> myBookings,
      Map<String, EventData>? eventData,
      BookingHistoryViewType viewType,
      BookingHistoryViewStatus status,
      String? errorMessage});
}

/// @nodoc
class __$$BookingHistoryViewStateImplCopyWithImpl<$Res>
    extends _$BookingHistoryViewStateCopyWithImpl<$Res,
        _$BookingHistoryViewStateImpl>
    implements _$$BookingHistoryViewStateImplCopyWith<$Res> {
  __$$BookingHistoryViewStateImplCopyWithImpl(
      _$BookingHistoryViewStateImpl _value,
      $Res Function(_$BookingHistoryViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myBookings = null,
    Object? eventData = freezed,
    Object? viewType = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$BookingHistoryViewStateImpl(
      myBookings: null == myBookings
          ? _value._myBookings
          : myBookings // ignore: cast_nullable_to_non_nullable
              as List<Booking>,
      eventData: freezed == eventData
          ? _value._eventData
          : eventData // ignore: cast_nullable_to_non_nullable
              as Map<String, EventData>?,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as BookingHistoryViewType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingHistoryViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BookingHistoryViewStateImpl
    with DiagnosticableTreeMixin
    implements _BookingHistoryViewState {
  const _$BookingHistoryViewStateImpl(
      {final List<Booking> myBookings = const [],
      final Map<String, EventData>? eventData,
      this.viewType = BookingHistoryViewType.UPCOMING,
      this.status = BookingHistoryViewStatus.initial,
      this.errorMessage})
      : _myBookings = myBookings,
        _eventData = eventData;

  final List<Booking> _myBookings;
  @override
  @JsonKey()
  List<Booking> get myBookings {
    if (_myBookings is EqualUnmodifiableListView) return _myBookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myBookings);
  }

// <BookindID, EventData>
  final Map<String, EventData>? _eventData;
// <BookindID, EventData>
  @override
  Map<String, EventData>? get eventData {
    final value = _eventData;
    if (value == null) return null;
    if (_eventData is EqualUnmodifiableMapView) return _eventData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final BookingHistoryViewType viewType;
  @override
  @JsonKey()
  final BookingHistoryViewStatus status;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookingHistoryViewState(myBookings: $myBookings, eventData: $eventData, viewType: $viewType, status: $status, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookingHistoryViewState'))
      ..add(DiagnosticsProperty('myBookings', myBookings))
      ..add(DiagnosticsProperty('eventData', eventData))
      ..add(DiagnosticsProperty('viewType', viewType))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingHistoryViewStateImpl &&
            const DeepCollectionEquality()
                .equals(other._myBookings, _myBookings) &&
            const DeepCollectionEquality()
                .equals(other._eventData, _eventData) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_myBookings),
      const DeepCollectionEquality().hash(_eventData),
      viewType,
      status,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingHistoryViewStateImplCopyWith<_$BookingHistoryViewStateImpl>
      get copyWith => __$$BookingHistoryViewStateImplCopyWithImpl<
          _$BookingHistoryViewStateImpl>(this, _$identity);
}

abstract class _BookingHistoryViewState implements BookingHistoryViewState {
  const factory _BookingHistoryViewState(
      {final List<Booking> myBookings,
      final Map<String, EventData>? eventData,
      final BookingHistoryViewType viewType,
      final BookingHistoryViewStatus status,
      final String? errorMessage}) = _$BookingHistoryViewStateImpl;

  @override
  List<Booking> get myBookings;
  @override // <BookindID, EventData>
  Map<String, EventData>? get eventData;
  @override
  BookingHistoryViewType get viewType;
  @override
  BookingHistoryViewStatus get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$BookingHistoryViewStateImplCopyWith<_$BookingHistoryViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

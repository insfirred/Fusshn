// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeViewState {
  List<EventData> get events =>
      throw _privateConstructorUsedError; // @Default([]) String selectedTag,
  int get paymentSuccessPopupTrigger => throw _privateConstructorUsedError;
  int get locationServicePopupTrigger => throw _privateConstructorUsedError;
  int get locationPermissionPopuptrigger => throw _privateConstructorUsedError;
  HomeViewStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeViewStateCopyWith<HomeViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewStateCopyWith<$Res> {
  factory $HomeViewStateCopyWith(
          HomeViewState value, $Res Function(HomeViewState) then) =
      _$HomeViewStateCopyWithImpl<$Res, HomeViewState>;
  @useResult
  $Res call(
      {List<EventData> events,
      int paymentSuccessPopupTrigger,
      int locationServicePopupTrigger,
      int locationPermissionPopuptrigger,
      HomeViewStatus status,
      String? errorMessage});
}

/// @nodoc
class _$HomeViewStateCopyWithImpl<$Res, $Val extends HomeViewState>
    implements $HomeViewStateCopyWith<$Res> {
  _$HomeViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? paymentSuccessPopupTrigger = null,
    Object? locationServicePopupTrigger = null,
    Object? locationPermissionPopuptrigger = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventData>,
      paymentSuccessPopupTrigger: null == paymentSuccessPopupTrigger
          ? _value.paymentSuccessPopupTrigger
          : paymentSuccessPopupTrigger // ignore: cast_nullable_to_non_nullable
              as int,
      locationServicePopupTrigger: null == locationServicePopupTrigger
          ? _value.locationServicePopupTrigger
          : locationServicePopupTrigger // ignore: cast_nullable_to_non_nullable
              as int,
      locationPermissionPopuptrigger: null == locationPermissionPopuptrigger
          ? _value.locationPermissionPopuptrigger
          : locationPermissionPopuptrigger // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeViewStateImplCopyWith<$Res>
    implements $HomeViewStateCopyWith<$Res> {
  factory _$$HomeViewStateImplCopyWith(
          _$HomeViewStateImpl value, $Res Function(_$HomeViewStateImpl) then) =
      __$$HomeViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventData> events,
      int paymentSuccessPopupTrigger,
      int locationServicePopupTrigger,
      int locationPermissionPopuptrigger,
      HomeViewStatus status,
      String? errorMessage});
}

/// @nodoc
class __$$HomeViewStateImplCopyWithImpl<$Res>
    extends _$HomeViewStateCopyWithImpl<$Res, _$HomeViewStateImpl>
    implements _$$HomeViewStateImplCopyWith<$Res> {
  __$$HomeViewStateImplCopyWithImpl(
      _$HomeViewStateImpl _value, $Res Function(_$HomeViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? paymentSuccessPopupTrigger = null,
    Object? locationServicePopupTrigger = null,
    Object? locationPermissionPopuptrigger = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$HomeViewStateImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventData>,
      paymentSuccessPopupTrigger: null == paymentSuccessPopupTrigger
          ? _value.paymentSuccessPopupTrigger
          : paymentSuccessPopupTrigger // ignore: cast_nullable_to_non_nullable
              as int,
      locationServicePopupTrigger: null == locationServicePopupTrigger
          ? _value.locationServicePopupTrigger
          : locationServicePopupTrigger // ignore: cast_nullable_to_non_nullable
              as int,
      locationPermissionPopuptrigger: null == locationPermissionPopuptrigger
          ? _value.locationPermissionPopuptrigger
          : locationPermissionPopuptrigger // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomeViewStateImpl
    with DiagnosticableTreeMixin
    implements _HomeViewState {
  const _$HomeViewStateImpl(
      {final List<EventData> events = const [],
      this.paymentSuccessPopupTrigger = 0,
      this.locationServicePopupTrigger = 0,
      this.locationPermissionPopuptrigger = 0,
      this.status = HomeViewStatus.initial,
      this.errorMessage})
      : _events = events;

  final List<EventData> _events;
  @override
  @JsonKey()
  List<EventData> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

// @Default([]) String selectedTag,
  @override
  @JsonKey()
  final int paymentSuccessPopupTrigger;
  @override
  @JsonKey()
  final int locationServicePopupTrigger;
  @override
  @JsonKey()
  final int locationPermissionPopuptrigger;
  @override
  @JsonKey()
  final HomeViewStatus status;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeViewState(events: $events, paymentSuccessPopupTrigger: $paymentSuccessPopupTrigger, locationServicePopupTrigger: $locationServicePopupTrigger, locationPermissionPopuptrigger: $locationPermissionPopuptrigger, status: $status, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeViewState'))
      ..add(DiagnosticsProperty('events', events))
      ..add(DiagnosticsProperty(
          'paymentSuccessPopupTrigger', paymentSuccessPopupTrigger))
      ..add(DiagnosticsProperty(
          'locationServicePopupTrigger', locationServicePopupTrigger))
      ..add(DiagnosticsProperty(
          'locationPermissionPopuptrigger', locationPermissionPopuptrigger))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeViewStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.paymentSuccessPopupTrigger,
                    paymentSuccessPopupTrigger) ||
                other.paymentSuccessPopupTrigger ==
                    paymentSuccessPopupTrigger) &&
            (identical(other.locationServicePopupTrigger,
                    locationServicePopupTrigger) ||
                other.locationServicePopupTrigger ==
                    locationServicePopupTrigger) &&
            (identical(other.locationPermissionPopuptrigger,
                    locationPermissionPopuptrigger) ||
                other.locationPermissionPopuptrigger ==
                    locationPermissionPopuptrigger) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      paymentSuccessPopupTrigger,
      locationServicePopupTrigger,
      locationPermissionPopuptrigger,
      status,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeViewStateImplCopyWith<_$HomeViewStateImpl> get copyWith =>
      __$$HomeViewStateImplCopyWithImpl<_$HomeViewStateImpl>(this, _$identity);
}

abstract class _HomeViewState implements HomeViewState {
  const factory _HomeViewState(
      {final List<EventData> events,
      final int paymentSuccessPopupTrigger,
      final int locationServicePopupTrigger,
      final int locationPermissionPopuptrigger,
      final HomeViewStatus status,
      final String? errorMessage}) = _$HomeViewStateImpl;

  @override
  List<EventData> get events;
  @override // @Default([]) String selectedTag,
  int get paymentSuccessPopupTrigger;
  @override
  int get locationServicePopupTrigger;
  @override
  int get locationPermissionPopuptrigger;
  @override
  HomeViewStatus get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$HomeViewStateImplCopyWith<_$HomeViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_ticket_sheet_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookTicketSheetViewState {
  TicketType? get selectedTicketType => throw _privateConstructorUsedError;
  int get selectedTicketCount => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookTicketSheetViewStateCopyWith<BookTicketSheetViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookTicketSheetViewStateCopyWith<$Res> {
  factory $BookTicketSheetViewStateCopyWith(BookTicketSheetViewState value,
          $Res Function(BookTicketSheetViewState) then) =
      _$BookTicketSheetViewStateCopyWithImpl<$Res, BookTicketSheetViewState>;
  @useResult
  $Res call(
      {TicketType? selectedTicketType,
      int selectedTicketCount,
      String eventId,
      String? error});
}

/// @nodoc
class _$BookTicketSheetViewStateCopyWithImpl<$Res,
        $Val extends BookTicketSheetViewState>
    implements $BookTicketSheetViewStateCopyWith<$Res> {
  _$BookTicketSheetViewStateCopyWithImpl(this._value, this._then);

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
    Object? error = freezed,
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
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookTicketSheetViewStateImplCopyWith<$Res>
    implements $BookTicketSheetViewStateCopyWith<$Res> {
  factory _$$BookTicketSheetViewStateImplCopyWith(
          _$BookTicketSheetViewStateImpl value,
          $Res Function(_$BookTicketSheetViewStateImpl) then) =
      __$$BookTicketSheetViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TicketType? selectedTicketType,
      int selectedTicketCount,
      String eventId,
      String? error});
}

/// @nodoc
class __$$BookTicketSheetViewStateImplCopyWithImpl<$Res>
    extends _$BookTicketSheetViewStateCopyWithImpl<$Res,
        _$BookTicketSheetViewStateImpl>
    implements _$$BookTicketSheetViewStateImplCopyWith<$Res> {
  __$$BookTicketSheetViewStateImplCopyWithImpl(
      _$BookTicketSheetViewStateImpl _value,
      $Res Function(_$BookTicketSheetViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTicketType = freezed,
    Object? selectedTicketCount = null,
    Object? eventId = null,
    Object? error = freezed,
  }) {
    return _then(_$BookTicketSheetViewStateImpl(
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
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BookTicketSheetViewStateImpl implements _BookTicketSheetViewState {
  const _$BookTicketSheetViewStateImpl(
      {this.selectedTicketType,
      this.selectedTicketCount = 1,
      this.eventId = '',
      this.error});

  @override
  final TicketType? selectedTicketType;
  @override
  @JsonKey()
  final int selectedTicketCount;
  @override
  @JsonKey()
  final String eventId;
  @override
  final String? error;

  @override
  String toString() {
    return 'BookTicketSheetViewState(selectedTicketType: $selectedTicketType, selectedTicketCount: $selectedTicketCount, eventId: $eventId, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookTicketSheetViewStateImpl &&
            (identical(other.selectedTicketType, selectedTicketType) ||
                other.selectedTicketType == selectedTicketType) &&
            (identical(other.selectedTicketCount, selectedTicketCount) ||
                other.selectedTicketCount == selectedTicketCount) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, selectedTicketType, selectedTicketCount, eventId, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookTicketSheetViewStateImplCopyWith<_$BookTicketSheetViewStateImpl>
      get copyWith => __$$BookTicketSheetViewStateImplCopyWithImpl<
          _$BookTicketSheetViewStateImpl>(this, _$identity);
}

abstract class _BookTicketSheetViewState implements BookTicketSheetViewState {
  const factory _BookTicketSheetViewState(
      {final TicketType? selectedTicketType,
      final int selectedTicketCount,
      final String eventId,
      final String? error}) = _$BookTicketSheetViewStateImpl;

  @override
  TicketType? get selectedTicketType;
  @override
  int get selectedTicketCount;
  @override
  String get eventId;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$BookTicketSheetViewStateImplCopyWith<_$BookTicketSheetViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

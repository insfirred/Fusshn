// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainViewState {
  int get locationServicePopupTrigger => throw _privateConstructorUsedError;
  int get locationPermissionPopuptrigger => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainViewStateCopyWith<MainViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainViewStateCopyWith<$Res> {
  factory $MainViewStateCopyWith(
          MainViewState value, $Res Function(MainViewState) then) =
      _$MainViewStateCopyWithImpl<$Res, MainViewState>;
  @useResult
  $Res call(
      {int locationServicePopupTrigger, int locationPermissionPopuptrigger});
}

/// @nodoc
class _$MainViewStateCopyWithImpl<$Res, $Val extends MainViewState>
    implements $MainViewStateCopyWith<$Res> {
  _$MainViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationServicePopupTrigger = null,
    Object? locationPermissionPopuptrigger = null,
  }) {
    return _then(_value.copyWith(
      locationServicePopupTrigger: null == locationServicePopupTrigger
          ? _value.locationServicePopupTrigger
          : locationServicePopupTrigger // ignore: cast_nullable_to_non_nullable
              as int,
      locationPermissionPopuptrigger: null == locationPermissionPopuptrigger
          ? _value.locationPermissionPopuptrigger
          : locationPermissionPopuptrigger // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainViewStateImplCopyWith<$Res>
    implements $MainViewStateCopyWith<$Res> {
  factory _$$MainViewStateImplCopyWith(
          _$MainViewStateImpl value, $Res Function(_$MainViewStateImpl) then) =
      __$$MainViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int locationServicePopupTrigger, int locationPermissionPopuptrigger});
}

/// @nodoc
class __$$MainViewStateImplCopyWithImpl<$Res>
    extends _$MainViewStateCopyWithImpl<$Res, _$MainViewStateImpl>
    implements _$$MainViewStateImplCopyWith<$Res> {
  __$$MainViewStateImplCopyWithImpl(
      _$MainViewStateImpl _value, $Res Function(_$MainViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationServicePopupTrigger = null,
    Object? locationPermissionPopuptrigger = null,
  }) {
    return _then(_$MainViewStateImpl(
      locationServicePopupTrigger: null == locationServicePopupTrigger
          ? _value.locationServicePopupTrigger
          : locationServicePopupTrigger // ignore: cast_nullable_to_non_nullable
              as int,
      locationPermissionPopuptrigger: null == locationPermissionPopuptrigger
          ? _value.locationPermissionPopuptrigger
          : locationPermissionPopuptrigger // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MainViewStateImpl implements _MainViewState {
  const _$MainViewStateImpl(
      {this.locationServicePopupTrigger = 0,
      this.locationPermissionPopuptrigger = 0});

  @override
  @JsonKey()
  final int locationServicePopupTrigger;
  @override
  @JsonKey()
  final int locationPermissionPopuptrigger;

  @override
  String toString() {
    return 'MainViewState(locationServicePopupTrigger: $locationServicePopupTrigger, locationPermissionPopuptrigger: $locationPermissionPopuptrigger)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainViewStateImpl &&
            (identical(other.locationServicePopupTrigger,
                    locationServicePopupTrigger) ||
                other.locationServicePopupTrigger ==
                    locationServicePopupTrigger) &&
            (identical(other.locationPermissionPopuptrigger,
                    locationPermissionPopuptrigger) ||
                other.locationPermissionPopuptrigger ==
                    locationPermissionPopuptrigger));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, locationServicePopupTrigger, locationPermissionPopuptrigger);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainViewStateImplCopyWith<_$MainViewStateImpl> get copyWith =>
      __$$MainViewStateImplCopyWithImpl<_$MainViewStateImpl>(this, _$identity);
}

abstract class _MainViewState implements MainViewState {
  const factory _MainViewState(
      {final int locationServicePopupTrigger,
      final int locationPermissionPopuptrigger}) = _$MainViewStateImpl;

  @override
  int get locationServicePopupTrigger;
  @override
  int get locationPermissionPopuptrigger;
  @override
  @JsonKey(ignore: true)
  _$$MainViewStateImplCopyWith<_$MainViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

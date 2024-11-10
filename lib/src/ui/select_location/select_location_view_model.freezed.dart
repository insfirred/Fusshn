// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_location_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectLocationViewState {
  String get searchQuery => throw _privateConstructorUsedError;
  List<String> get allIndianCities => throw _privateConstructorUsedError;
  bool get isLocationServiceEnabled => throw _privateConstructorUsedError;
  bool get haveLocationPermission => throw _privateConstructorUsedError;
  List<Placemark>? get currentPlacemarks => throw _privateConstructorUsedError;
  SelectLocationViewStatus get status => throw _privateConstructorUsedError;
  Position? get currentPosition => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectLocationViewStateCopyWith<SelectLocationViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectLocationViewStateCopyWith<$Res> {
  factory $SelectLocationViewStateCopyWith(SelectLocationViewState value,
          $Res Function(SelectLocationViewState) then) =
      _$SelectLocationViewStateCopyWithImpl<$Res, SelectLocationViewState>;
  @useResult
  $Res call(
      {String searchQuery,
      List<String> allIndianCities,
      bool isLocationServiceEnabled,
      bool haveLocationPermission,
      List<Placemark>? currentPlacemarks,
      SelectLocationViewStatus status,
      Position? currentPosition});
}

/// @nodoc
class _$SelectLocationViewStateCopyWithImpl<$Res,
        $Val extends SelectLocationViewState>
    implements $SelectLocationViewStateCopyWith<$Res> {
  _$SelectLocationViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? allIndianCities = null,
    Object? isLocationServiceEnabled = null,
    Object? haveLocationPermission = null,
    Object? currentPlacemarks = freezed,
    Object? status = null,
    Object? currentPosition = freezed,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      allIndianCities: null == allIndianCities
          ? _value.allIndianCities
          : allIndianCities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLocationServiceEnabled: null == isLocationServiceEnabled
          ? _value.isLocationServiceEnabled
          : isLocationServiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      haveLocationPermission: null == haveLocationPermission
          ? _value.haveLocationPermission
          : haveLocationPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPlacemarks: freezed == currentPlacemarks
          ? _value.currentPlacemarks
          : currentPlacemarks // ignore: cast_nullable_to_non_nullable
              as List<Placemark>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SelectLocationViewStatus,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectLocationViewStateImplCopyWith<$Res>
    implements $SelectLocationViewStateCopyWith<$Res> {
  factory _$$SelectLocationViewStateImplCopyWith(
          _$SelectLocationViewStateImpl value,
          $Res Function(_$SelectLocationViewStateImpl) then) =
      __$$SelectLocationViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery,
      List<String> allIndianCities,
      bool isLocationServiceEnabled,
      bool haveLocationPermission,
      List<Placemark>? currentPlacemarks,
      SelectLocationViewStatus status,
      Position? currentPosition});
}

/// @nodoc
class __$$SelectLocationViewStateImplCopyWithImpl<$Res>
    extends _$SelectLocationViewStateCopyWithImpl<$Res,
        _$SelectLocationViewStateImpl>
    implements _$$SelectLocationViewStateImplCopyWith<$Res> {
  __$$SelectLocationViewStateImplCopyWithImpl(
      _$SelectLocationViewStateImpl _value,
      $Res Function(_$SelectLocationViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? allIndianCities = null,
    Object? isLocationServiceEnabled = null,
    Object? haveLocationPermission = null,
    Object? currentPlacemarks = freezed,
    Object? status = null,
    Object? currentPosition = freezed,
  }) {
    return _then(_$SelectLocationViewStateImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      allIndianCities: null == allIndianCities
          ? _value._allIndianCities
          : allIndianCities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLocationServiceEnabled: null == isLocationServiceEnabled
          ? _value.isLocationServiceEnabled
          : isLocationServiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      haveLocationPermission: null == haveLocationPermission
          ? _value.haveLocationPermission
          : haveLocationPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPlacemarks: freezed == currentPlacemarks
          ? _value._currentPlacemarks
          : currentPlacemarks // ignore: cast_nullable_to_non_nullable
              as List<Placemark>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SelectLocationViewStatus,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
    ));
  }
}

/// @nodoc

class _$SelectLocationViewStateImpl implements _SelectLocationViewState {
  const _$SelectLocationViewStateImpl(
      {this.searchQuery = "",
      final List<String> allIndianCities = const [],
      this.isLocationServiceEnabled = false,
      this.haveLocationPermission = false,
      final List<Placemark>? currentPlacemarks,
      this.status = SelectLocationViewStatus.NO_FETCHING,
      this.currentPosition})
      : _allIndianCities = allIndianCities,
        _currentPlacemarks = currentPlacemarks;

  @override
  @JsonKey()
  final String searchQuery;
  final List<String> _allIndianCities;
  @override
  @JsonKey()
  List<String> get allIndianCities {
    if (_allIndianCities is EqualUnmodifiableListView) return _allIndianCities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allIndianCities);
  }

  @override
  @JsonKey()
  final bool isLocationServiceEnabled;
  @override
  @JsonKey()
  final bool haveLocationPermission;
  final List<Placemark>? _currentPlacemarks;
  @override
  List<Placemark>? get currentPlacemarks {
    final value = _currentPlacemarks;
    if (value == null) return null;
    if (_currentPlacemarks is EqualUnmodifiableListView)
      return _currentPlacemarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final SelectLocationViewStatus status;
  @override
  final Position? currentPosition;

  @override
  String toString() {
    return 'SelectLocationViewState(searchQuery: $searchQuery, allIndianCities: $allIndianCities, isLocationServiceEnabled: $isLocationServiceEnabled, haveLocationPermission: $haveLocationPermission, currentPlacemarks: $currentPlacemarks, status: $status, currentPosition: $currentPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectLocationViewStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._allIndianCities, _allIndianCities) &&
            (identical(
                    other.isLocationServiceEnabled, isLocationServiceEnabled) ||
                other.isLocationServiceEnabled == isLocationServiceEnabled) &&
            (identical(other.haveLocationPermission, haveLocationPermission) ||
                other.haveLocationPermission == haveLocationPermission) &&
            const DeepCollectionEquality()
                .equals(other._currentPlacemarks, _currentPlacemarks) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchQuery,
      const DeepCollectionEquality().hash(_allIndianCities),
      isLocationServiceEnabled,
      haveLocationPermission,
      const DeepCollectionEquality().hash(_currentPlacemarks),
      status,
      currentPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectLocationViewStateImplCopyWith<_$SelectLocationViewStateImpl>
      get copyWith => __$$SelectLocationViewStateImplCopyWithImpl<
          _$SelectLocationViewStateImpl>(this, _$identity);
}

abstract class _SelectLocationViewState implements SelectLocationViewState {
  const factory _SelectLocationViewState(
      {final String searchQuery,
      final List<String> allIndianCities,
      final bool isLocationServiceEnabled,
      final bool haveLocationPermission,
      final List<Placemark>? currentPlacemarks,
      final SelectLocationViewStatus status,
      final Position? currentPosition}) = _$SelectLocationViewStateImpl;

  @override
  String get searchQuery;
  @override
  List<String> get allIndianCities;
  @override
  bool get isLocationServiceEnabled;
  @override
  bool get haveLocationPermission;
  @override
  List<Placemark>? get currentPlacemarks;
  @override
  SelectLocationViewStatus get status;
  @override
  Position? get currentPosition;
  @override
  @JsonKey(ignore: true)
  _$$SelectLocationViewStateImplCopyWith<_$SelectLocationViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

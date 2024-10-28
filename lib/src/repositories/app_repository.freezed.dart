// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  User? get authUser => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;
  bool get isLocationServiceEnabled => throw _privateConstructorUsedError;
  bool get haveLocationPermission => throw _privateConstructorUsedError;
  int get locationServicePopupTrigger => throw _privateConstructorUsedError;
  int get locationPermissionPopuptrigger => throw _privateConstructorUsedError;
  List<Placemark>? get currentPlacemarks => throw _privateConstructorUsedError;
  Position? get currentPosition => throw _privateConstructorUsedError;
  AppStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {User? authUser,
      UserData? userData,
      bool isLocationServiceEnabled,
      bool haveLocationPermission,
      int locationServicePopupTrigger,
      int locationPermissionPopuptrigger,
      List<Placemark>? currentPlacemarks,
      Position? currentPosition,
      AppStatus status});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUser = freezed,
    Object? userData = freezed,
    Object? isLocationServiceEnabled = null,
    Object? haveLocationPermission = null,
    Object? locationServicePopupTrigger = null,
    Object? locationPermissionPopuptrigger = null,
    Object? currentPlacemarks = freezed,
    Object? currentPosition = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      authUser: freezed == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as User?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      isLocationServiceEnabled: null == isLocationServiceEnabled
          ? _value.isLocationServiceEnabled
          : isLocationServiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      haveLocationPermission: null == haveLocationPermission
          ? _value.haveLocationPermission
          : haveLocationPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      locationServicePopupTrigger: null == locationServicePopupTrigger
          ? _value.locationServicePopupTrigger
          : locationServicePopupTrigger // ignore: cast_nullable_to_non_nullable
              as int,
      locationPermissionPopuptrigger: null == locationPermissionPopuptrigger
          ? _value.locationPermissionPopuptrigger
          : locationPermissionPopuptrigger // ignore: cast_nullable_to_non_nullable
              as int,
      currentPlacemarks: freezed == currentPlacemarks
          ? _value.currentPlacemarks
          : currentPlacemarks // ignore: cast_nullable_to_non_nullable
              as List<Placemark>?,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? authUser,
      UserData? userData,
      bool isLocationServiceEnabled,
      bool haveLocationPermission,
      int locationServicePopupTrigger,
      int locationPermissionPopuptrigger,
      List<Placemark>? currentPlacemarks,
      Position? currentPosition,
      AppStatus status});
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUser = freezed,
    Object? userData = freezed,
    Object? isLocationServiceEnabled = null,
    Object? haveLocationPermission = null,
    Object? locationServicePopupTrigger = null,
    Object? locationPermissionPopuptrigger = null,
    Object? currentPlacemarks = freezed,
    Object? currentPosition = freezed,
    Object? status = null,
  }) {
    return _then(_$AppStateImpl(
      authUser: freezed == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as User?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      isLocationServiceEnabled: null == isLocationServiceEnabled
          ? _value.isLocationServiceEnabled
          : isLocationServiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      haveLocationPermission: null == haveLocationPermission
          ? _value.haveLocationPermission
          : haveLocationPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      locationServicePopupTrigger: null == locationServicePopupTrigger
          ? _value.locationServicePopupTrigger
          : locationServicePopupTrigger // ignore: cast_nullable_to_non_nullable
              as int,
      locationPermissionPopuptrigger: null == locationPermissionPopuptrigger
          ? _value.locationPermissionPopuptrigger
          : locationPermissionPopuptrigger // ignore: cast_nullable_to_non_nullable
              as int,
      currentPlacemarks: freezed == currentPlacemarks
          ? _value._currentPlacemarks
          : currentPlacemarks // ignore: cast_nullable_to_non_nullable
              as List<Placemark>?,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
    ));
  }
}

/// @nodoc

class _$AppStateImpl with DiagnosticableTreeMixin implements _AppState {
  const _$AppStateImpl(
      {this.authUser = null,
      this.userData,
      this.isLocationServiceEnabled = false,
      this.haveLocationPermission = false,
      this.locationServicePopupTrigger = 0,
      this.locationPermissionPopuptrigger = 0,
      final List<Placemark>? currentPlacemarks,
      this.currentPosition,
      this.status = AppStatus.initial})
      : _currentPlacemarks = currentPlacemarks;

  @override
  @JsonKey()
  final User? authUser;
  @override
  final UserData? userData;
  @override
  @JsonKey()
  final bool isLocationServiceEnabled;
  @override
  @JsonKey()
  final bool haveLocationPermission;
  @override
  @JsonKey()
  final int locationServicePopupTrigger;
  @override
  @JsonKey()
  final int locationPermissionPopuptrigger;
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
  final Position? currentPosition;
  @override
  @JsonKey()
  final AppStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(authUser: $authUser, userData: $userData, isLocationServiceEnabled: $isLocationServiceEnabled, haveLocationPermission: $haveLocationPermission, locationServicePopupTrigger: $locationServicePopupTrigger, locationPermissionPopuptrigger: $locationPermissionPopuptrigger, currentPlacemarks: $currentPlacemarks, currentPosition: $currentPosition, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('authUser', authUser))
      ..add(DiagnosticsProperty('userData', userData))
      ..add(DiagnosticsProperty(
          'isLocationServiceEnabled', isLocationServiceEnabled))
      ..add(
          DiagnosticsProperty('haveLocationPermission', haveLocationPermission))
      ..add(DiagnosticsProperty(
          'locationServicePopupTrigger', locationServicePopupTrigger))
      ..add(DiagnosticsProperty(
          'locationPermissionPopuptrigger', locationPermissionPopuptrigger))
      ..add(DiagnosticsProperty('currentPlacemarks', currentPlacemarks))
      ..add(DiagnosticsProperty('currentPosition', currentPosition))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(
                    other.isLocationServiceEnabled, isLocationServiceEnabled) ||
                other.isLocationServiceEnabled == isLocationServiceEnabled) &&
            (identical(other.haveLocationPermission, haveLocationPermission) ||
                other.haveLocationPermission == haveLocationPermission) &&
            (identical(other.locationServicePopupTrigger,
                    locationServicePopupTrigger) ||
                other.locationServicePopupTrigger ==
                    locationServicePopupTrigger) &&
            (identical(other.locationPermissionPopuptrigger,
                    locationPermissionPopuptrigger) ||
                other.locationPermissionPopuptrigger ==
                    locationPermissionPopuptrigger) &&
            const DeepCollectionEquality()
                .equals(other._currentPlacemarks, _currentPlacemarks) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      authUser,
      userData,
      isLocationServiceEnabled,
      haveLocationPermission,
      locationServicePopupTrigger,
      locationPermissionPopuptrigger,
      const DeepCollectionEquality().hash(_currentPlacemarks),
      currentPosition,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final User? authUser,
      final UserData? userData,
      final bool isLocationServiceEnabled,
      final bool haveLocationPermission,
      final int locationServicePopupTrigger,
      final int locationPermissionPopuptrigger,
      final List<Placemark>? currentPlacemarks,
      final Position? currentPosition,
      final AppStatus status}) = _$AppStateImpl;

  @override
  User? get authUser;
  @override
  UserData? get userData;
  @override
  bool get isLocationServiceEnabled;
  @override
  bool get haveLocationPermission;
  @override
  int get locationServicePopupTrigger;
  @override
  int get locationPermissionPopuptrigger;
  @override
  List<Placemark>? get currentPlacemarks;
  @override
  Position? get currentPosition;
  @override
  AppStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

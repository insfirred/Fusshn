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
  AppStatus get status => throw _privateConstructorUsedError;
  String get latestPlayStoreVersion => throw _privateConstructorUsedError;
  String get latestAppStoreVersion => throw _privateConstructorUsedError;
  String get currentAppVersion => throw _privateConstructorUsedError;
  bool get isUpdateAvailable => throw _privateConstructorUsedError;
  LocationData? get userLocationData => throw _privateConstructorUsedError;

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
      AppStatus status,
      String latestPlayStoreVersion,
      String latestAppStoreVersion,
      String currentAppVersion,
      bool isUpdateAvailable,
      LocationData? userLocationData});
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
    Object? status = null,
    Object? latestPlayStoreVersion = null,
    Object? latestAppStoreVersion = null,
    Object? currentAppVersion = null,
    Object? isUpdateAvailable = null,
    Object? userLocationData = freezed,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
      latestPlayStoreVersion: null == latestPlayStoreVersion
          ? _value.latestPlayStoreVersion
          : latestPlayStoreVersion // ignore: cast_nullable_to_non_nullable
              as String,
      latestAppStoreVersion: null == latestAppStoreVersion
          ? _value.latestAppStoreVersion
          : latestAppStoreVersion // ignore: cast_nullable_to_non_nullable
              as String,
      currentAppVersion: null == currentAppVersion
          ? _value.currentAppVersion
          : currentAppVersion // ignore: cast_nullable_to_non_nullable
              as String,
      isUpdateAvailable: null == isUpdateAvailable
          ? _value.isUpdateAvailable
          : isUpdateAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      userLocationData: freezed == userLocationData
          ? _value.userLocationData
          : userLocationData // ignore: cast_nullable_to_non_nullable
              as LocationData?,
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
      AppStatus status,
      String latestPlayStoreVersion,
      String latestAppStoreVersion,
      String currentAppVersion,
      bool isUpdateAvailable,
      LocationData? userLocationData});
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
    Object? status = null,
    Object? latestPlayStoreVersion = null,
    Object? latestAppStoreVersion = null,
    Object? currentAppVersion = null,
    Object? isUpdateAvailable = null,
    Object? userLocationData = freezed,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
      latestPlayStoreVersion: null == latestPlayStoreVersion
          ? _value.latestPlayStoreVersion
          : latestPlayStoreVersion // ignore: cast_nullable_to_non_nullable
              as String,
      latestAppStoreVersion: null == latestAppStoreVersion
          ? _value.latestAppStoreVersion
          : latestAppStoreVersion // ignore: cast_nullable_to_non_nullable
              as String,
      currentAppVersion: null == currentAppVersion
          ? _value.currentAppVersion
          : currentAppVersion // ignore: cast_nullable_to_non_nullable
              as String,
      isUpdateAvailable: null == isUpdateAvailable
          ? _value.isUpdateAvailable
          : isUpdateAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      userLocationData: freezed == userLocationData
          ? _value.userLocationData
          : userLocationData // ignore: cast_nullable_to_non_nullable
              as LocationData?,
    ));
  }
}

/// @nodoc

class _$AppStateImpl with DiagnosticableTreeMixin implements _AppState {
  const _$AppStateImpl(
      {this.authUser = null,
      this.userData,
      this.status = AppStatus.initial,
      this.latestPlayStoreVersion = "",
      this.latestAppStoreVersion = "",
      this.currentAppVersion = "",
      this.isUpdateAvailable = false,
      this.userLocationData});

  @override
  @JsonKey()
  final User? authUser;
  @override
  final UserData? userData;
  @override
  @JsonKey()
  final AppStatus status;
  @override
  @JsonKey()
  final String latestPlayStoreVersion;
  @override
  @JsonKey()
  final String latestAppStoreVersion;
  @override
  @JsonKey()
  final String currentAppVersion;
  @override
  @JsonKey()
  final bool isUpdateAvailable;
  @override
  final LocationData? userLocationData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(authUser: $authUser, userData: $userData, status: $status, latestPlayStoreVersion: $latestPlayStoreVersion, latestAppStoreVersion: $latestAppStoreVersion, currentAppVersion: $currentAppVersion, isUpdateAvailable: $isUpdateAvailable, userLocationData: $userLocationData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('authUser', authUser))
      ..add(DiagnosticsProperty('userData', userData))
      ..add(DiagnosticsProperty('status', status))
      ..add(
          DiagnosticsProperty('latestPlayStoreVersion', latestPlayStoreVersion))
      ..add(DiagnosticsProperty('latestAppStoreVersion', latestAppStoreVersion))
      ..add(DiagnosticsProperty('currentAppVersion', currentAppVersion))
      ..add(DiagnosticsProperty('isUpdateAvailable', isUpdateAvailable))
      ..add(DiagnosticsProperty('userLocationData', userLocationData));
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
            (identical(other.status, status) || other.status == status) &&
            (identical(other.latestPlayStoreVersion, latestPlayStoreVersion) ||
                other.latestPlayStoreVersion == latestPlayStoreVersion) &&
            (identical(other.latestAppStoreVersion, latestAppStoreVersion) ||
                other.latestAppStoreVersion == latestAppStoreVersion) &&
            (identical(other.currentAppVersion, currentAppVersion) ||
                other.currentAppVersion == currentAppVersion) &&
            (identical(other.isUpdateAvailable, isUpdateAvailable) ||
                other.isUpdateAvailable == isUpdateAvailable) &&
            (identical(other.userLocationData, userLocationData) ||
                other.userLocationData == userLocationData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      authUser,
      userData,
      status,
      latestPlayStoreVersion,
      latestAppStoreVersion,
      currentAppVersion,
      isUpdateAvailable,
      userLocationData);

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
      final AppStatus status,
      final String latestPlayStoreVersion,
      final String latestAppStoreVersion,
      final String currentAppVersion,
      final bool isUpdateAvailable,
      final LocationData? userLocationData}) = _$AppStateImpl;

  @override
  User? get authUser;
  @override
  UserData? get userData;
  @override
  AppStatus get status;
  @override
  String get latestPlayStoreVersion;
  @override
  String get latestAppStoreVersion;
  @override
  String get currentAppVersion;
  @override
  bool get isUpdateAvailable;
  @override
  LocationData? get userLocationData;
  @override
  @JsonKey(ignore: true)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

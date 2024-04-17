// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthViewState {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String? get nameError => throw _privateConstructorUsedError;
  String? get emailError => throw _privateConstructorUsedError;
  String? get passwordError => throw _privateConstructorUsedError;
  String? get confirmPasswordError => throw _privateConstructorUsedError;
  String? get mobileError => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  bool get showConfirmPassword => throw _privateConstructorUsedError;
  AuthViewStatus get status => throw _privateConstructorUsedError;
  AuthViewType get activeScreen => throw _privateConstructorUsedError;
  bool get isLogin => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthViewStateCopyWith<AuthViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthViewStateCopyWith<$Res> {
  factory $AuthViewStateCopyWith(
          AuthViewState value, $Res Function(AuthViewState) then) =
      _$AuthViewStateCopyWithImpl<$Res, AuthViewState>;
  @useResult
  $Res call(
      {String name,
      String email,
      String password,
      String confirmPassword,
      String mobile,
      String? nameError,
      String? emailError,
      String? passwordError,
      String? confirmPasswordError,
      String? mobileError,
      Gender? gender,
      bool showPassword,
      bool showConfirmPassword,
      AuthViewStatus status,
      AuthViewType activeScreen,
      bool isLogin,
      String? errorMessage});
}

/// @nodoc
class _$AuthViewStateCopyWithImpl<$Res, $Val extends AuthViewState>
    implements $AuthViewStateCopyWith<$Res> {
  _$AuthViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? mobile = null,
    Object? nameError = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? confirmPasswordError = freezed,
    Object? mobileError = freezed,
    Object? gender = freezed,
    Object? showPassword = null,
    Object? showConfirmPassword = null,
    Object? status = null,
    Object? activeScreen = null,
    Object? isLogin = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      nameError: freezed == nameError
          ? _value.nameError
          : nameError // ignore: cast_nullable_to_non_nullable
              as String?,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPasswordError: freezed == confirmPasswordError
          ? _value.confirmPasswordError
          : confirmPasswordError // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileError: freezed == mobileError
          ? _value.mobileError
          : mobileError // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmPassword: null == showConfirmPassword
          ? _value.showConfirmPassword
          : showConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthViewStatus,
      activeScreen: null == activeScreen
          ? _value.activeScreen
          : activeScreen // ignore: cast_nullable_to_non_nullable
              as AuthViewType,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthViewStateImplCopyWith<$Res>
    implements $AuthViewStateCopyWith<$Res> {
  factory _$$AuthViewStateImplCopyWith(
          _$AuthViewStateImpl value, $Res Function(_$AuthViewStateImpl) then) =
      __$$AuthViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String password,
      String confirmPassword,
      String mobile,
      String? nameError,
      String? emailError,
      String? passwordError,
      String? confirmPasswordError,
      String? mobileError,
      Gender? gender,
      bool showPassword,
      bool showConfirmPassword,
      AuthViewStatus status,
      AuthViewType activeScreen,
      bool isLogin,
      String? errorMessage});
}

/// @nodoc
class __$$AuthViewStateImplCopyWithImpl<$Res>
    extends _$AuthViewStateCopyWithImpl<$Res, _$AuthViewStateImpl>
    implements _$$AuthViewStateImplCopyWith<$Res> {
  __$$AuthViewStateImplCopyWithImpl(
      _$AuthViewStateImpl _value, $Res Function(_$AuthViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? mobile = null,
    Object? nameError = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? confirmPasswordError = freezed,
    Object? mobileError = freezed,
    Object? gender = freezed,
    Object? showPassword = null,
    Object? showConfirmPassword = null,
    Object? status = null,
    Object? activeScreen = null,
    Object? isLogin = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AuthViewStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      nameError: freezed == nameError
          ? _value.nameError
          : nameError // ignore: cast_nullable_to_non_nullable
              as String?,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPasswordError: freezed == confirmPasswordError
          ? _value.confirmPasswordError
          : confirmPasswordError // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileError: freezed == mobileError
          ? _value.mobileError
          : mobileError // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmPassword: null == showConfirmPassword
          ? _value.showConfirmPassword
          : showConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthViewStatus,
      activeScreen: null == activeScreen
          ? _value.activeScreen
          : activeScreen // ignore: cast_nullable_to_non_nullable
              as AuthViewType,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthViewStateImpl
    with DiagnosticableTreeMixin
    implements _AuthViewState {
  const _$AuthViewStateImpl(
      {this.name = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.mobile = '',
      this.nameError,
      this.emailError,
      this.passwordError,
      this.confirmPasswordError,
      this.mobileError,
      this.gender,
      this.showPassword = false,
      this.showConfirmPassword = false,
      this.status = AuthViewStatus.initial,
      this.activeScreen = AuthViewType.login,
      this.isLogin = true,
      this.errorMessage});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String confirmPassword;
  @override
  @JsonKey()
  final String mobile;
  @override
  final String? nameError;
  @override
  final String? emailError;
  @override
  final String? passwordError;
  @override
  final String? confirmPasswordError;
  @override
  final String? mobileError;
  @override
  final Gender? gender;
  @override
  @JsonKey()
  final bool showPassword;
  @override
  @JsonKey()
  final bool showConfirmPassword;
  @override
  @JsonKey()
  final AuthViewStatus status;
  @override
  @JsonKey()
  final AuthViewType activeScreen;
  @override
  @JsonKey()
  final bool isLogin;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthViewState(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, mobile: $mobile, nameError: $nameError, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, mobileError: $mobileError, gender: $gender, showPassword: $showPassword, showConfirmPassword: $showConfirmPassword, status: $status, activeScreen: $activeScreen, isLogin: $isLogin, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthViewState'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('confirmPassword', confirmPassword))
      ..add(DiagnosticsProperty('mobile', mobile))
      ..add(DiagnosticsProperty('nameError', nameError))
      ..add(DiagnosticsProperty('emailError', emailError))
      ..add(DiagnosticsProperty('passwordError', passwordError))
      ..add(DiagnosticsProperty('confirmPasswordError', confirmPasswordError))
      ..add(DiagnosticsProperty('mobileError', mobileError))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('showPassword', showPassword))
      ..add(DiagnosticsProperty('showConfirmPassword', showConfirmPassword))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('activeScreen', activeScreen))
      ..add(DiagnosticsProperty('isLogin', isLogin))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthViewStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.nameError, nameError) ||
                other.nameError == nameError) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.confirmPasswordError, confirmPasswordError) ||
                other.confirmPasswordError == confirmPasswordError) &&
            (identical(other.mobileError, mobileError) ||
                other.mobileError == mobileError) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(other.showConfirmPassword, showConfirmPassword) ||
                other.showConfirmPassword == showConfirmPassword) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activeScreen, activeScreen) ||
                other.activeScreen == activeScreen) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      password,
      confirmPassword,
      mobile,
      nameError,
      emailError,
      passwordError,
      confirmPasswordError,
      mobileError,
      gender,
      showPassword,
      showConfirmPassword,
      status,
      activeScreen,
      isLogin,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthViewStateImplCopyWith<_$AuthViewStateImpl> get copyWith =>
      __$$AuthViewStateImplCopyWithImpl<_$AuthViewStateImpl>(this, _$identity);
}

abstract class _AuthViewState implements AuthViewState {
  const factory _AuthViewState(
      {final String name,
      final String email,
      final String password,
      final String confirmPassword,
      final String mobile,
      final String? nameError,
      final String? emailError,
      final String? passwordError,
      final String? confirmPasswordError,
      final String? mobileError,
      final Gender? gender,
      final bool showPassword,
      final bool showConfirmPassword,
      final AuthViewStatus status,
      final AuthViewType activeScreen,
      final bool isLogin,
      final String? errorMessage}) = _$AuthViewStateImpl;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String get mobile;
  @override
  String? get nameError;
  @override
  String? get emailError;
  @override
  String? get passwordError;
  @override
  String? get confirmPasswordError;
  @override
  String? get mobileError;
  @override
  Gender? get gender;
  @override
  bool get showPassword;
  @override
  bool get showConfirmPassword;
  @override
  AuthViewStatus get status;
  @override
  AuthViewType get activeScreen;
  @override
  bool get isLogin;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AuthViewStateImplCopyWith<_$AuthViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

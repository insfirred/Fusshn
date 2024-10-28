// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditProfileViewState {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get nameError => throw _privateConstructorUsedError;
  String? get mobileError => throw _privateConstructorUsedError;
  EditProfileViewStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileViewStateCopyWith<EditProfileViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileViewStateCopyWith<$Res> {
  factory $EditProfileViewStateCopyWith(EditProfileViewState value,
          $Res Function(EditProfileViewState) then) =
      _$EditProfileViewStateCopyWithImpl<$Res, EditProfileViewState>;
  @useResult
  $Res call(
      {String name,
      String email,
      String mobile,
      String? imageUrl,
      String? nameError,
      String? mobileError,
      EditProfileViewStatus status,
      String? errorMessage});
}

/// @nodoc
class _$EditProfileViewStateCopyWithImpl<$Res,
        $Val extends EditProfileViewState>
    implements $EditProfileViewStateCopyWith<$Res> {
  _$EditProfileViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? mobile = null,
    Object? imageUrl = freezed,
    Object? nameError = freezed,
    Object? mobileError = freezed,
    Object? status = null,
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
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nameError: freezed == nameError
          ? _value.nameError
          : nameError // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileError: freezed == mobileError
          ? _value.mobileError
          : mobileError // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EditProfileViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditProfileViewStateImplCopyWith<$Res>
    implements $EditProfileViewStateCopyWith<$Res> {
  factory _$$EditProfileViewStateImplCopyWith(_$EditProfileViewStateImpl value,
          $Res Function(_$EditProfileViewStateImpl) then) =
      __$$EditProfileViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String mobile,
      String? imageUrl,
      String? nameError,
      String? mobileError,
      EditProfileViewStatus status,
      String? errorMessage});
}

/// @nodoc
class __$$EditProfileViewStateImplCopyWithImpl<$Res>
    extends _$EditProfileViewStateCopyWithImpl<$Res, _$EditProfileViewStateImpl>
    implements _$$EditProfileViewStateImplCopyWith<$Res> {
  __$$EditProfileViewStateImplCopyWithImpl(_$EditProfileViewStateImpl _value,
      $Res Function(_$EditProfileViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? mobile = null,
    Object? imageUrl = freezed,
    Object? nameError = freezed,
    Object? mobileError = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$EditProfileViewStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nameError: freezed == nameError
          ? _value.nameError
          : nameError // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileError: freezed == mobileError
          ? _value.mobileError
          : mobileError // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EditProfileViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EditProfileViewStateImpl implements _EditProfileViewState {
  const _$EditProfileViewStateImpl(
      {this.name = '',
      this.email = '',
      this.mobile = '',
      this.imageUrl,
      this.nameError,
      this.mobileError,
      this.status = EditProfileViewStatus.initial,
      this.errorMessage});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String mobile;
  @override
  final String? imageUrl;
  @override
  final String? nameError;
  @override
  final String? mobileError;
  @override
  @JsonKey()
  final EditProfileViewStatus status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'EditProfileViewState(name: $name, email: $email, mobile: $mobile, imageUrl: $imageUrl, nameError: $nameError, mobileError: $mobileError, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileViewStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.nameError, nameError) ||
                other.nameError == nameError) &&
            (identical(other.mobileError, mobileError) ||
                other.mobileError == mobileError) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, mobile, imageUrl,
      nameError, mobileError, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileViewStateImplCopyWith<_$EditProfileViewStateImpl>
      get copyWith =>
          __$$EditProfileViewStateImplCopyWithImpl<_$EditProfileViewStateImpl>(
              this, _$identity);
}

abstract class _EditProfileViewState implements EditProfileViewState {
  const factory _EditProfileViewState(
      {final String name,
      final String email,
      final String mobile,
      final String? imageUrl,
      final String? nameError,
      final String? mobileError,
      final EditProfileViewStatus status,
      final String? errorMessage}) = _$EditProfileViewStateImpl;

  @override
  String get name;
  @override
  String get email;
  @override
  String get mobile;
  @override
  String? get imageUrl;
  @override
  String? get nameError;
  @override
  String? get mobileError;
  @override
  EditProfileViewStatus get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$EditProfileViewStateImplCopyWith<_$EditProfileViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

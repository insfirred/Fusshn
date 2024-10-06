import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:string_validator/string_validator.dart';

import '../../common/enums.dart';
import '../../models/user_data.dart';
import '../../services/firebase_auth.dart';
import '../../services/firestore.dart';

part 'auth_view_model.freezed.dart';

final authViewModelProvider =
    StateNotifierProvider.autoDispose<AuthViewModel, AuthViewState>(
  (ref) => AuthViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class AuthViewModel extends StateNotifier<AuthViewState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final AutoDisposeStateNotifierProviderRef ref;

  AuthViewModel({
    required this.firebaseAuth,
    required this.firestore,
    required this.ref,
  }) : super(const AuthViewState());

  setName(String name) => state = state.copyWith(
        name: name,
        status: AuthViewStatus.initial,
        nameError: null,
      );

  setEmail(String email) => state = state.copyWith(
        email: email,
        status: AuthViewStatus.initial,
        emailError: null,
      );

  setPassword(String password) => state = state.copyWith(
        password: password,
        status: AuthViewStatus.initial,
        passwordError: null,
      );

  setConfirmPassword(String confirmPassword) => state = state.copyWith(
        confirmPassword: confirmPassword,
        status: AuthViewStatus.initial,
        confirmPasswordError: null,
      );

  setGender(Gender gender) => state = state.copyWith(
        gender: gender,
        status: AuthViewStatus.initial,
      );

  setAuthViewScreen(AuthViewType screen) => state = state.copyWith(
      activeScreen: screen,
      status: AuthViewStatus.initial,
      showPassword: false,
      showConfirmPassword: false,
      nameError: null,
      emailError: null,
      passwordError: null,
      confirmPasswordError: null,
      mobileError: null,
      isTermsAccepted: false);

  setPhone(String mobile) => state = state.copyWith(
        mobile: mobile,
        status: AuthViewStatus.initial,
        mobileError: null,
      );

  setShowPassword(bool val) => state = state.copyWith(
        showPassword: val,
        status: AuthViewStatus.initial,
      );

  setShowConfirmPassword(bool val) => state = state.copyWith(
        showConfirmPassword: val,
        status: AuthViewStatus.initial,
      );

  setIsTermsAccepted(bool val) => state = state.copyWith(
        isTermsAccepted: val,
        status: AuthViewStatus.initial,
      );

  Future<void> register() async {
    try {
      // user input validation
      if (!(_validatingFields(
        checkName: true,
        checkEmail: true,
        checkPassword: true,
        checkConfirmPassword: true,
        checkPhoneNumber: true,
        checkTerms: true,
      ))) return;

      // registering user with email and password
      state = state.copyWith(status: AuthViewStatus.loading);
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: state.email,
        password: state.password,
      )
          .then(
        (creds) async {
          // storing UserData in firestore.
          Map<String, dynamic> userData = UserData(
            uid: creds.user!.uid,
            name: state.name,
            email: state.email,
            phone: state.mobile,
          ).toJson();

          await firestore
              .collection(UserData.userCollectionKey)
              .doc(creds.user!.uid)
              .set(userData);
        },
      );
      state = state.copyWith(status: AuthViewStatus.success);
    }

    // Add FirebaseAuthException catch (e)
    catch (e) {
      _setError(e.toString());
    }
  }

  Future<void> login() async {
    try {
      // user input validation
      if (!(_validatingFields(checkEmail: true, checkPassword: true))) return;

      // logging user with email and password
      log('User Login Initiated');
      state = state.copyWith(status: AuthViewStatus.loading);
      log('In loading state');

      await firebaseAuth.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      state = state.copyWith(status: AuthViewStatus.success);
    }

    // TODO: Add FirebaseAuthException catch (e)
    catch (e) {
      _setError(e.toString());
    }
  }

  logout() {
    firebaseAuth.signOut();
  }

  bool _validatingFields({
    bool? checkName,
    bool? checkEmail,
    bool? checkPassword,
    bool? checkConfirmPassword,
    bool? checkPhoneNumber,
    bool? checkTerms,
  }) {
    if (checkName ?? false) {
      if (state.name.isEmpty) {
        state = state.copyWith(nameError: 'Name can\'t be empty');
        return false;
      }
    }

    if (checkPhoneNumber ?? false) {
      if (state.mobile.isEmpty) {
        state = state.copyWith(mobileError: 'Phone number can\'t be empty');
        return false;
      }

      if (state.mobile.length != 10 || !isNumeric(state.mobile)) {
        state = state.copyWith(
          mobileError: 'Please enter a valid 10 digit phone number',
        );
        return false;
      }
    }

    if (checkEmail ?? false) {
      if (state.email.isEmpty) {
        state = state.copyWith(emailError: 'Email can\'t be empty');
        return false;
      }

      final bool emailValid = isEmail(state.email);

      if (!emailValid) {
        state = state.copyWith(emailError: 'Please enter a valid email');
        return false;
      }
    }

    if (checkPassword ?? false) {
      if (state.password.isEmpty) {
        state = state.copyWith(passwordError: 'Password can\'t be empty');
        return false;
      }
    }

    if (checkConfirmPassword ?? false) {
      if (state.confirmPassword.isEmpty) {
        state = state.copyWith(
          confirmPasswordError: 'Confirm password field can\'t be empty',
        );
        return false;
      }

      if (state.confirmPassword != state.password) {
        state = state.copyWith(
          confirmPasswordError: 'Confirm password doesn\'t match with password',
        );
        return false;
      }
    }

    if (checkTerms ?? false) {
      if (state.isTermsAccepted == false) {
        _setError('Please accept the terms and conditions before signing up');
        return false;
      }
    }

    return true;
  }

  _setError(String? error) => state = state.copyWith(
        errorMessage: error,
        status: AuthViewStatus.error,
      );
}

@freezed
class AuthViewState with _$AuthViewState {
  const factory AuthViewState({
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default('') String mobile,
    String? nameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? mobileError,
    Gender? gender,
    @Default(false) bool showPassword,
    @Default(false) bool showConfirmPassword,
    @Default(false) bool isTermsAccepted,
    @Default(AuthViewStatus.initial) AuthViewStatus status,
    @Default(AuthViewType.login) AuthViewType activeScreen,
    @Default(true) bool isLogin,
    String? errorMessage,
  }) = _AuthViewState;
}

enum AuthViewStatus {
  initial,
  loading,
  success,
  error,
}

enum AuthViewType {
  login,
  register,
}

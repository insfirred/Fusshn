import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/models/event_data.dart';

import '../../services/firestore.dart';

part 'home_view_model.freezed.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeViewState>(
  (ref) => HomeViewModel(
    firestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class HomeViewModel extends StateNotifier<HomeViewState> {
  final FirebaseFirestore firestore;
  final AutoDisposeStateNotifierProviderRef ref;

  HomeViewModel({
    required this.firestore,
    required this.ref,
  }) : super(const HomeViewState()) {
    _fetchEventData();
  }

  _fetchEventData() async {
    state = state.copyWith(status: HomeViewStatus.loading);
    var listSnapshot = await firestore.collection('events').get();

    List<EventData> events = listSnapshot.docs
        .map((eventSnapshot) => EventData.fromJson(eventSnapshot.data()))
        .toList();

    state = state.copyWith(events: events, status: HomeViewStatus.success);
  }

  // setName(String name) => state = state.copyWith(
  //       name: name,
  //       status: AuthViewStatus.initial,
  //       nameError: null,
  //     );

  // setEmail(String email) => state = state.copyWith(
  //       email: email,
  //       status: AuthViewStatus.initial,
  //       emailError: null,
  //     );

  // setPassword(String password) => state = state.copyWith(
  //       password: password,
  //       status: AuthViewStatus.initial,
  //       passwordError: null,
  //     );

  // setConfirmPassword(String confirmPassword) => state = state.copyWith(
  //       confirmPassword: confirmPassword,
  //       status: AuthViewStatus.initial,
  //       confirmPasswordError: null,
  //     );

  // setGender(Gender gender) => state = state.copyWith(
  //       gender: gender,
  //       status: AuthViewStatus.initial,
  //     );

  // setAuthViewScreen(AuthViewType screen) => state = state.copyWith(
  //     activeScreen: screen,
  //     status: AuthViewStatus.initial,
  //     showPassword: false,
  //     showConfirmPassword: false,
  //     nameError: null,
  //     emailError: null,
  //     passwordError: null,
  //     confirmPasswordError: null,
  //     mobileError: null,
  //     isTermsAccepted: false);

  // setPhone(String mobile) => state = state.copyWith(
  //       mobile: mobile,
  //       status: AuthViewStatus.initial,
  //       mobileError: null,
  //     );

  // setShowPassword(bool val) => state = state.copyWith(
  //       showPassword: val,
  //       status: AuthViewStatus.initial,
  //     );

  // setShowConfirmPassword(bool val) => state = state.copyWith(
  //       showConfirmPassword: val,
  //       status: AuthViewStatus.initial,
  //     );

  // setIsTermsAccepted(bool val) => state = state.copyWith(
  //       isTermsAccepted: val,
  //       status: AuthViewStatus.initial,
  //     );

  // Future<void> register() async {
  //   try {
  //     // user input validation
  //     if (!(_validatingFields(
  //       checkName: true,
  //       checkEmail: true,
  //       checkPassword: true,
  //       checkConfirmPassword: true,
  //       checkPhoneNumber: true,
  //       checkTerms: true,
  //     ))) return;

  //     // registering user with email and password
  //     await firebaseAuth
  //         .createUserWithEmailAndPassword(
  //       email: state.email,
  //       password: state.password,
  //     )
  //         .then(
  //       (creds) async {
  //         // storing UserData in firestore.
  //         Map<String, dynamic> userData = UserData(
  //           uid: creds.user!.uid,
  //           name: state.name,
  //           email: state.email,
  //           phone: state.mobile,
  //         ).toJson();

  //         await firestore
  //             .collection(UserData.userCollectionKey)
  //             .doc(creds.user!.uid)
  //             .set(userData);
  //       },
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       _setError('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       _setError('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     _setError(e.toString());
  //   }
  // }

  // Future<void> login() async {
  //   try {
  //     // user input validation
  //     if (!(_validatingFields(checkEmail: true, checkPassword: true))) return;

  //     // logging user with email and password
  //     await firebaseAuth.signInWithEmailAndPassword(
  //       email: state.email,
  //       password: state.password,
  //     );

  //     // debugPrint(credential.user.toString());
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       _setError('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       _setError('Wrong password provided for that user.');
  //     }
  //   } catch (e) {
  //     _setError(e.toString());
  //   }
  // }

  // bool _validatingFields({
  //   bool? checkName,
  //   bool? checkEmail,
  //   bool? checkPassword,
  //   bool? checkConfirmPassword,
  //   bool? checkPhoneNumber,
  //   bool? checkTerms,
  // }) {
  //   if (checkName ?? false) {
  //     if (state.name.isEmpty) {
  //       state = state.copyWith(nameError: 'Name can\'t be empty');
  //       return false;
  //     }
  //   }

  //   if (checkPhoneNumber ?? false) {
  //     if (state.mobile.isEmpty) {
  //       state = state.copyWith(mobileError: 'Phone number can\'t be empty');
  //       return false;
  //     }

  //     if (state.mobile.length != 10 || !isNumeric(state.mobile)) {
  //       state = state.copyWith(
  //         mobileError: 'Please enter a valid 10 digit phone number',
  //       );
  //       return false;
  //     }
  //   }

  //   if (checkEmail ?? false) {
  //     if (state.email.isEmpty) {
  //       state = state.copyWith(emailError: 'Email can\'t be empty');
  //       return false;
  //     }

  //     final bool emailValid = isEmail(state.email);

  //     if (!emailValid) {
  //       state = state.copyWith(emailError: 'Please enter a valid email');
  //       return false;
  //     }
  //   }

  //   if (checkPassword ?? false) {
  //     if (state.password.isEmpty) {
  //       state = state.copyWith(passwordError: 'Password can\'t be empty');
  //       return false;
  //     }
  //   }

  //   if (checkConfirmPassword ?? false) {
  //     if (state.confirmPassword.isEmpty) {
  //       state = state.copyWith(
  //         confirmPasswordError: 'Confirm password field can\'t be empty',
  //       );
  //       return false;
  //     }

  //     if (state.confirmPassword != state.password) {
  //       state = state.copyWith(
  //         confirmPasswordError: 'Confirm password doesn\'t match with password',
  //       );
  //       return false;
  //     }
  //   }

  //   if (checkTerms ?? false) {
  //     if (state.isTermsAccepted == false) {
  //       _setError('Please accept the terms and conditions before signing up');
  //       return false;
  //     }
  //   }

  //   return true;
  // }

  // _setError(String? error) => state = state.copyWith(
  //       errorMessage: error,
  //       status: AuthViewStatus.error,
  //     );
}

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default([]) List<EventData> events,
    @Default(HomeViewStatus.initial) HomeViewStatus status,
    String? errorMessage,
  }) = _HomeViewState;
}

enum HomeViewStatus {
  initial,
  loading,
  success,
  error,
}

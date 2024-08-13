import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../models/user_data.dart';
import '../services/firebase_auth.dart';
import '../services/firestore.dart';

part 'app_repository.freezed.dart';

final appRepositoryProvider = StateNotifierProvider<AppRepository, AppState>(
  (ref) => AppRepository(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
  ),
);

class AppRepository extends StateNotifier<AppState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  late final StreamSubscription _subscription;

  AppRepository({
    required this.firebaseAuth,
    required this.firestore,
  }) : super(const AppState()) {
    () async {
      await Future.delayed(const Duration(milliseconds: 2000));
      _subscription = firebaseAuth.authStateChanges().listen(
        (user) async {
          debugPrint('authStateChanges() triggered');
          debugPrint(user.toString());

          if (user == null) {
            state = state.copyWith(status: AppStatus.unauthenticated);
          } else {
            state = state.copyWith(
              authUser: user,
              status: AppStatus.authenticated,
            );
          }
          _fetchCurrentUserData();
          _getCurrentPosition();
        },
      );
    }();
  }

  refreshUserData() => _fetchCurrentUserData();

  _fetchCurrentUserData() async {
    print('fetching user data from cloud....');
    var snapshot = await firestore
        .collection(UserData.userCollectionKey)
        .doc(state.authUser!.uid)
        .get();

    if (snapshot.exists) {
      UserData userData = UserData.fromJson(snapshot.data()!);
      state = state.copyWith(userData: userData);
    } else {
      // TODO: HAndle this error
    }
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition().then(
      (Position position) async {
        state = state.copyWith(currentPosition: position);
        await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        ).then(
          (placemarks) {
            state = state.copyWith(
              currentPlacemarks: placemarks,
            );
          },
        ).catchError((e) {
          debugPrint(e);
        });
      },
    ).catchError(
      (e) {
        debugPrint(e);
      },
    );
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled. Please enable the services');

      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  // retryUserDataFetch() {
  //   _fetchUserDataAndSetState(state.authUser);
  // }

  // Future<ApiResponse> createUser({
  //   required String username,
  // }) async {
  //   // TODO: generate an avatar for the user, and upload it
  //   final response = await apiService.createUser(
  //     username: username,
  //     profilePicUrl: '',
  //     authToken: (await getIdToken()) ?? '',
  //     mobileNumber: state.authUser?.phoneNumber ?? '',
  //     fullName: '',
  //   );

  //   if (response.status == ApiStatus.success) {
  //     // update status of the user to authenticatedWithUserData
  //     state = state.copyWith(
  //       status: AppStatus.authenticatedWithUserData,
  //       // TODO: review and modify it
  //       userData: UserResponse(
  //         username: username,
  //         fullName: '',
  //         isSubscribed: false,
  //         profilePicUrl: '',
  //         fcmToken: null,
  //       ),
  //     );
  //   }
  //   return response;
  // }

  // Future<ApiResponse> deleteUser() async {
  //   final response = await apiService.deleteUser(
  //     authToken: await getIdToken() ?? '',
  //   );
  //   if (response.status == ApiStatus.success) {
  //     state = state.copyWith(
  //       status: AppStatus.unauthenticated,
  //     );
  //   }
  //   return response;
  // }

  // /// returns the idToken to be used for any 'private' API calls
  // /// if token gets expired, it refreshes the token and returns a new one
  // Future<String?> getIdToken({User? user}) async {
  //   final currentUser = user ?? firebaseAuth.currentUser;
  //   if (currentUser == null) return null;
  //   final idTokenResult = await currentUser.getIdTokenResult();
  //   // debugPrint(idTokenResult.toString());
  //   final String idToken;

  //   // check if token is null or is expired, then get the refreshed token
  //   if (idTokenResult.token == null ||
  //       (idTokenResult.expirationTime != null &&
  //           idTokenResult.expirationTime!.isBefore(DateTime.now()))) {
  //     debugPrint('token expired...refreshing token');
  //     // refresh the ID Token
  //     idToken = await currentUser.getIdToken(true);
  //   } else {
  //     // else, get the token from result
  //     idToken = idTokenResult.token!;
  //   }
  //   // debugPrint(idToken);
  //   return idToken;
  // }

  void logout() {
    firebaseAuth.signOut();
  }

  // Future<AppStatus> _fetchUserDataAndNavigate() async {
  //   AppStatus currentStatus = AppStatus.initial;
  //   try {
  //     final String currentUserId = state.authUser!.uid;
  //     print('current userId: $currentUserId');
  //     final CollectionReference<Map<String, dynamic>> usersCollection =
  //         firestore.collection(UserData.userCollectionKey);

  //     await usersCollection.doc(currentUserId).get().then(
  //       (json) {
  //         // here we checking if the current users have selected preferences or not
  //         // based on the result we are setting the corresponding state
  //         if (json.data()?[UserData.preferencesKey].length == 0) {
  //           print("Preferences not present");
  //           currentStatus = AppStatus.authenticatedWithNoPrefs;
  //         } else {
  //           currentStatus = AppStatus.authenticatedWithPrefs;
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     print(e);
  //   }

  //   return currentStatus;
  // }

  // /// fetches user data from server & sets the state
  // _fetchUserDataAndSetState(User? user) async {
  //   final idToken = await user?.getIdToken();
  //   debugPrint(idToken);

  //   if (idToken == null) {
  //     state = state.copyWith(
  //       status: AppStatus.unauthenticated,
  //     );
  //   } else {
  //     final response = await apiService.getUserData(
  //       authToken: await user?.getIdToken() ?? '',
  //     );
  //     if (response.status == ApiStatus.success) {
  //       state = state.copyWith(
  //         authUser: user,
  //         userData: response.data!,
  //         status: AppStatus.authenticatedWithUserData,
  //       );
  //       final fcmToken = await firebaseMessaging.getToken();
  //       debugPrint('fcmToken: $fcmToken');

  //       if (response.data!.fcmToken != fcmToken) {
  //         apiService.updateUserData(
  //           updateUserData: UpdateUserRequest(
  //             fcmToken: fcmToken,
  //           ),
  //           authToken: idToken,
  //         );
  //       }
  //     } else if (response.errorMessage == 'User not found!') {
  //       // user is authenticated, but user data is not present
  //       state = state.copyWith(
  //         authUser: user,
  //         status: AppStatus.authenticatedWithNoUserData,
  //       );
  //     } else if (response.errorMessage == noInternetErrorString) {
  //       // user is authenticated, but couldn't fetch user data as there's no internet connection
  //       state = state.copyWith(
  //         authUser: user,
  //         status: AppStatus.authenticatedButNoInternetConnection,
  //       );
  //     } else {
  //       // handle any other error here
  //       // TODO: handle error
  //       debugPrint('Error while fetching user data');
  //       debugPrint(response.toString());
  //     }
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(null) User? authUser,
    UserData? userData,
    List<Placemark>? currentPlacemarks,
    Position? currentPosition,
    @Default(AppStatus.initial) AppStatus status,
  }) = _AppState;
}

enum AppStatus {
  initial,
  unauthenticated,
  // authenticatedButNoInternetConnection,
  authenticated,
}

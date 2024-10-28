import 'dart:async';
import 'dart:developer';

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
  late final StreamSubscription _locationServiceSubscription;

  AppRepository({
    required this.firebaseAuth,
    required this.firestore,
  }) : super(const AppState()) {
    () async {
      // it's a duration for splash screen
      await Future.delayed(const Duration(milliseconds: 2000));

      // listens to auth changes and redirects accordingly.
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
          getCurrentPosition();
        },
      );

      // listens to location service and sets in app repo
      _locationServiceSubscription = Geolocator.getServiceStatusStream().listen(
        (ServiceStatus locStatus) {
          if (locStatus == ServiceStatus.enabled) {
            state = state.copyWith(isLocationServiceEnabled: true);
          } else {
            state = state.copyWith(
              isLocationServiceEnabled: false,
              locationServicePopupTrigger:
                  state.locationServicePopupTrigger + 1,
            );
          }
        },
      );
    }();
  }

  setProfilePicUrlInFireStore(String url) async {
    try {
      final currentUserId = state.authUser!.uid;
      final userCollection = firestore.collection('users');
      await userCollection.doc(currentUserId).set(
        {'imageUrl': url},
        SetOptions(merge: true),
      );

      refreshUserData();
    } catch (e) {
      log(e.toString());
    }
  }

  refreshUserData() => _fetchCurrentUserData();

  void logout() {
    firebaseAuth.signOut();
  }

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

  Future<void> getCurrentPosition() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // Checking if the device location is ON or OFF.
    if (!serviceEnabled) {
      state = state.copyWith(isLocationServiceEnabled: false);
      return;
    }

    state = state.copyWith(isLocationServiceEnabled: serviceEnabled);

    final hasLocationPermission = await _handleLocationPermission();

    if (!hasLocationPermission) return;

    state = state.copyWith(haveLocationPermission: hasLocationPermission);

    await Geolocator.getCurrentPosition().then(
      (Position position) async {
        _setCurrentPosition(position);
        await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        ).then(
          (placemarks) {
            _setCurrentPlacemarks(placemarks);
          },
        ).catchError((e) {
          debugPrint(e);
        });
      },
    ).catchError(
      (e) {
        log(e.toString());
      },
    );
  }

  Future<bool> _handleLocationPermission() async {
    LocationPermission permission;

    // Checking whats the status of location permission...
    // return true if location access is there for this time else false.
    permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.always:
        return true;

      case LocationPermission.whileInUse:
        return true;

      case LocationPermission.denied:
        return false;

      case LocationPermission.deniedForever:
        return false;

      case LocationPermission.unableToDetermine:
        return false;
    }
  }

  _setCurrentPlacemarks(List<Placemark>? val) => state = state.copyWith(
        currentPlacemarks: val,
      );

  _setCurrentPosition(Position? val) => state = state.copyWith(
        currentPosition: val,
      );

  void _showLocationServicePopup() => state = state.copyWith(
        locationServicePopupTrigger: state.locationServicePopupTrigger + 1,
      );

  // void _showLocationPermissionPopup() => state = state.copyWith(
  //       locationPermissionPopuptrigger:
  //           state.locationPermissionPopuptrigger + 1,
  //     );

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
    _locationServiceSubscription.cancel();
  }
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(null) User? authUser,
    UserData? userData,
    @Default(false) bool isLocationServiceEnabled,
    @Default(false) bool haveLocationPermission,
    @Default(0) int locationServicePopupTrigger,
    @Default(0) int locationPermissionPopuptrigger,
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

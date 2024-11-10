import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/models/location_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../common/hive_keys.dart';
import '../models/user_data.dart';
import '../services/firebase_auth.dart';
import '../services/firestore.dart';
import '../services/hive_service.dart';

part 'app_repository.freezed.dart';

final appRepositoryProvider = StateNotifierProvider<AppRepository, AppState>(
  (ref) => AppRepository(
      firebaseAuth: ref.watch(firebaseAuthProvider),
      firestore: ref.watch(firestoreProvider),
      hive: ref.watch(hiveProvider)),
);

class AppRepository extends StateNotifier<AppState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final HiveInterface hive;
  late final StreamSubscription _subscription;
  late final StreamSubscription _locationServiceSubscription;

  AppRepository({
    required this.firebaseAuth,
    required this.firestore,
    required this.hive,
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
            // checking if user already selected location.
            Map? userLastLocation = _hasLastLocation();
            if (userLastLocation == null) {
              state = state.copyWith(
                authUser: user,
                status: AppStatus.authenticatedWithNoLocation,
              );
            } else {
              state = state.copyWith(
                authUser: user,
                status: AppStatus.authenticated,
                userLocationData: LocationData.fromJson(
                  Map.castFrom<dynamic, dynamic, String, dynamic>(
                    userLastLocation,
                  ),
                ),
              );
            }
            await _fetchCurrentUserData();
          }
        },
      );

      // listens to location service and sets in app repo
      // _locationServiceSubscription = Geolocator.getServiceStatusStream().listen(
      //   (ServiceStatus locStatus) {
      //     if (locStatus == ServiceStatus.enabled) {
      //       state = state.copyWith(isLocationServiceEnabled: true);
      //     } else {
      //       state = state.copyWith(
      //         isLocationServiceEnabled: false,
      //         locationServicePopupTrigger:
      //             state.locationServicePopupTrigger + 1,
      //       );
      //     }
      //   },
      // );
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

  setUserLocationData(LocationData data) => state = state.copyWith(
        userLocationData: data,
      );

  setAppStatus(AppStatus status) => state = state.copyWith(
        status: status,
      );

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

  // void _showLocationPermissionPopup() => state = state.copyWith(
  //       locationPermissionPopuptrigger:
  //           state.locationPermissionPopuptrigger + 1,
  //     );

  /// returns user's last location, if not present then returns null.
  Map? _hasLastLocation() {
    var myLocationDataBox = hive.box<Map>(HiveKeys.myLocationDataBoxKey);
    return myLocationDataBox.get(HiveKeys.lastLocationFieldKey);
  }

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
    @Default(AppStatus.initial) AppStatus status,
    LocationData? userLocationData,
  }) = _AppState;
}

enum AppStatus {
  initial,
  unauthenticated,
  authenticatedWithNoLocation,
  authenticated,
}
// authenticatedButNoInternetConnection,
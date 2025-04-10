import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusshn/src/services/firebase_rtdb.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../common/firestore_keys.dart';
import '../common/hive_keys.dart';
import '../models/location_data.dart';
import '../models/user_data.dart';
import '../services/firebase_auth.dart';
import '../services/firestore.dart';
import '../services/hive_service.dart';

part 'app_repository.freezed.dart';

final appRepositoryProvider = StateNotifierProvider<AppRepository, AppState>(
  (ref) => AppRepository(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
    hive: ref.watch(hiveProvider),
    database: ref.watch(firebaseRtdb),
  ),
);

class AppRepository extends StateNotifier<AppState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final HiveInterface hive;
  final FirebaseDatabase database;
  late final StreamSubscription _subscription;
  late final StreamSubscription _locationServiceSubscription;

  AppRepository({
    required this.firebaseAuth,
    required this.firestore,
    required this.hive,
    required this.database,
  }) : super(const AppState()) {
    () async {
      // it's a duration for splash screen
      await Future.delayed(const Duration(milliseconds: 3000));

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
              log('last location: $userLastLocation');
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
            _isUpdateAvailable();
          }
        },
      );
    }();
  }

  setProfilePicUrlInFireStore(String url) async {
    try {
      final currentUserId = state.authUser!.uid;
      final userCollection =
          firestore.collection(FirestoreKeys.userGlobalCollection);
      await userCollection.doc(currentUserId).set(
        {'imageUrl': url},
        SetOptions(merge: true),
      );

      refreshUserData();
    } catch (e) {
      log(e.toString());
    }
  }

  setEmailVerifiedInFirestore() async {
    try {
      final currentUserId = state.authUser!.uid;
      final userCollection = firestore.collection('users');
      await userCollection.doc(currentUserId).set(
        {'isEmailVerified': true},
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

  User? getCurrentUser() => firebaseAuth.currentUser;

  void logout() {
    firebaseAuth.signOut();
  }

  deleteUserAccount() async {
    User? currentUser = firebaseAuth.currentUser;
    await currentUser?.delete();

    _deleterUserDetailsFromFirestore();
  }

  _fetchCurrentUserData() async {
    print('fetching user data from cloud....');
    var snapshot = await firestore
        .collection(FirestoreKeys.userGlobalCollection)
        .doc(state.authUser!.uid)
        .get();

    if (snapshot.exists) {
      UserData userData = UserData.fromJson(snapshot.data()!);
      state = state.copyWith(userData: userData);
    } else {
      // TODO: HAndle this error
    }
  }

  /// returns user's last location, if not present then returns null.
  Map? _hasLastLocation() {
    var myLocationDataBox = hive.box<Map>(HiveKeys.myLocationDataBoxKey);
    return myLocationDataBox.get(HiveKeys.lastLocationFieldKey);
  }

  _deleterUserDetailsFromFirestore() async {
    await firestore.collection('users').doc(state.userData?.uid).delete();
  }

  _fetchLatestStoreVersions() async {
    var pathRef = await database.ref('latestStoreVersions').get();
    if (pathRef.exists) {
      var data = pathRef.value as Map<dynamic, dynamic>;
      if (data.containsKey('appStore')) {
        state = state.copyWith(latestAppStoreVersion: data['appStore']);
      }
      if (data.containsKey('playStore')) {
        state = state.copyWith(latestPlayStoreVersion: data['playStore']);
      }
    }
  }

  Future<String> _fetchCurrentAppVersion() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    state = state.copyWith(currentAppVersion: info.version);
    return info.version;
  }

  _isUpdateAvailable() async {
    await _fetchCurrentAppVersion();
    await _fetchLatestStoreVersions();

    String latestVersion = Platform.isIOS
        ? state.latestPlayStoreVersion
        : state.latestPlayStoreVersion;
    String currentVersion = state.currentAppVersion;

    state = state.copyWith(
      isUpdateAvailable: _isCurrentLowerVersion(currentVersion, latestVersion),
    );
  }

  bool _isCurrentLowerVersion(String currentVersion, String latestVersion) {
    List<String> currentParts = currentVersion.split('.');
    List<String> latestParts = latestVersion.split('.');

    int maxLength = currentParts.length > latestParts.length
        ? currentParts.length
        : latestParts.length;

    for (int i = 0; i < maxLength; i++) {
      int current = i < currentParts.length ? int.parse(currentParts[i]) : 0;
      int latest = i < latestParts.length ? int.parse(latestParts[i]) : 0;

      if (current < latest) return true; // Update is available
      if (current > latest) return false; // Current version is newer
    }

    return false; // Versions are the same
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
    @Default("") String latestPlayStoreVersion,
    @Default("") String latestAppStoreVersion,
    @Default("") String currentAppVersion,
    @Default(false) bool isUpdateAvailable,
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
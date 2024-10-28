import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:string_validator/string_validator.dart';

import '../../models/user_data.dart';
import '../../repositories/app_repository.dart';
import '../../services/firebase_storage_provider.dart';
import '../../services/firestore.dart';

part 'edit_profile_view_model.freezed.dart';

final editProfileViewModelProvider = StateNotifierProvider.autoDispose<
    EditProfileViewModel, EditProfileViewState>(
  (ref) => EditProfileViewModel(
    firestore: ref.watch(firestoreProvider),
    storage: ref.watch(firebaseStorageProvider),
    ref: ref,
  ),
);

class EditProfileViewModel extends StateNotifier<EditProfileViewState> {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  final AutoDisposeStateNotifierProviderRef ref;

  EditProfileViewModel({
    required this.firestore,
    required this.storage,
    required this.ref,
  }) : super(const EditProfileViewState()) {
    _settingUserDataInState();
  }

  pickImageAndUpload(ImageSource imagesource) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: imagesource);

    if (image != null) {
      final Reference storageReference = storage.ref().child(
            'images/${ref.read(appRepositoryProvider).authUser!.uid}/user_profile_image',
          );
      UploadTask? uploadTask = storageReference.putFile(
        File(image.path),
      );

      final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      final String url = await snapshot.ref.getDownloadURL();
      state = state.copyWith(imageUrl: url);
      ref.read(appRepositoryProvider.notifier).setProfilePicUrlInFireStore(url);
    } else {
      log('No Image selected');
    }
  }

  setName(String name) => state = state.copyWith(
        name: name,
        status: EditProfileViewStatus.initial,
        nameError: null,
      );

  setEmail(String name) => state = state.copyWith(
        name: name,
      );

  setPhone(String mobile) => state = state.copyWith(
        mobile: mobile,
        status: EditProfileViewStatus.initial,
        mobileError: null,
      );

  _settingUserDataInState() {
    UserData user = ref.read(appRepositoryProvider).userData!;

    state = state.copyWith(
      name: user.name ?? '',
      email: user.email,
      mobile: user.phone ?? '',
      imageUrl: user.imageUrl,
    );
  }

  saveDetailsPressed() async {
    try {
      state = state.copyWith(status: EditProfileViewStatus.loading);
      if (!_validatingFields()) return false;

      await firestore
          .collection('users')
          .doc(ref.read(appRepositoryProvider).userData!.uid)
          .update({'name': state.name, 'phone': state.mobile});

      ref.read(appRepositoryProvider.notifier).refreshUserData();

      state = state.copyWith(status: EditProfileViewStatus.success);
    } catch (e) {
      _setError(e.toString());
      print(e);
    }
  }

  bool _validatingFields() {
    if (state.name.isEmpty) {
      state = state.copyWith(nameError: 'Name can\'t be empty');
      return false;
    }

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

    return true;
  }

  _setError(String? error) => state = state.copyWith(
        errorMessage: error,
        status: EditProfileViewStatus.error,
      );
}

@freezed
class EditProfileViewState with _$EditProfileViewState {
  const factory EditProfileViewState({
    @Default('') String name,
    @Default('') String email,
    @Default('') String mobile,
    String? imageUrl,
    String? nameError,
    String? mobileError,
    @Default(EditProfileViewStatus.initial) EditProfileViewStatus status,
    String? errorMessage,
  }) = _EditProfileViewState;
}

enum EditProfileViewStatus {
  initial,
  loading,
  success,
  error,
}

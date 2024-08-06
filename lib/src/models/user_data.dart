import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  // firestore keys
  static String userCollectionKey = 'users';
  static String uidKey = 'uid';
  static String nameKey = 'name';
  static String emailKey = 'email';
  static String phoneKey = 'phone';

  final String uid;
  final String name;
  final String email;
  final String phone;

  const UserData({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

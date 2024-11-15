import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final String uid;
  final String? name;
  final String email;
  final String? phone;
  final String? imageUrl;
  final bool isEmailVerified;
  final List<String>? bookingIdsList;

  const UserData({
    required this.uid,
    this.name,
    required this.email,
    this.phone,
    this.imageUrl,
    this.isEmailVerified = false,
    this.bookingIdsList,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

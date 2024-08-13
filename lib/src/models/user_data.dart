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
  static String allBookingsKey = 'all_bookings';

  final String uid;
  final String? name;
  final String email;
  final String? phone;
  final String? imageUrl;
  final List<String>? bookingIdsList;

  const UserData({
    required this.uid,
    this.name,
    required this.email,
    this.phone,
    this.imageUrl,
    this.bookingIdsList,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

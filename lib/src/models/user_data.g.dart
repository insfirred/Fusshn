// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      uid: json['uid'] as String,
      name: json['name'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      imageUrl: json['imageUrl'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      bookingIdsList: (json['bookingIdsList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'imageUrl': instance.imageUrl,
      'isEmailVerified': instance.isEmailVerified,
      'bookingIdsList': instance.bookingIdsList,
    };

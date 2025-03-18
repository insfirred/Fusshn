// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      id: json['id'] as String,
      paymentId: json['paymentId'] as String,
      eventId: json['eventId'] as String,
      ticketType:
          TicketType.fromJson(json['ticketType'] as Map<String, dynamic>),
      ticketCount: (json['ticketCount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userPhone: json['userPhone'] as String,
      userEmail: json['userEmail'] as String,
      isCheckIn: json['isCheckIn'] as bool,
      totalUserAllowed: (json['totalUserAllowed'] as num).toInt(),
      numberOfUserCheckedIn: (json['numberOfUserCheckedIn'] as num).toInt(),
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'paymentId': instance.paymentId,
      'eventId': instance.eventId,
      'ticketType': instance.ticketType.toJson(),
      'ticketCount': instance.ticketCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'userId': instance.userId,
      'userName': instance.userName,
      'userPhone': instance.userPhone,
      'userEmail': instance.userEmail,
      'isCheckIn': instance.isCheckIn,
      'totalUserAllowed': instance.totalUserAllowed,
      'numberOfUserCheckedIn': instance.numberOfUserCheckedIn,
    };

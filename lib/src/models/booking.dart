import 'package:freezed_annotation/freezed_annotation.dart';

import 'ticket_type.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  final String id;
  final String paymentId;
  final String eventId;
  final TicketType ticketType;
  final int ticketCount;
  final DateTime createdAt;
  final String userId;
  final String userName;
  final String userPhone;
  final String userEmail;
  final bool isCheckIn;
  final int totalUserAllowed;
  final int numberOfUserCheckedIn;

  const Booking({
    required this.id,
    required this.paymentId,
    required this.eventId,
    required this.ticketType,
    required this.ticketCount,
    required this.createdAt,
    required this.userId,
    required this.userName,
    required this.userPhone,
    required this.userEmail,
    required this.isCheckIn,
    required this.totalUserAllowed,
    required this.numberOfUserCheckedIn,
  });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}

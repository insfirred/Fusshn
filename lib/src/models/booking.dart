import 'package:freezed_annotation/freezed_annotation.dart';

import 'ticket_type.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  static String idey = 'id';
  static String paymentIdKey = 'payment_id';
  static String eventIdKey = 'event_id';
  static String ticketTypeKey = 'ticket_type';
  static String ticketCountKey = 'ticket_count';
  static String createdAtKey = 'created_at';

  final String id;
  final String paymentId;
  final String eventId;
  final TicketType ticketType;
  final int ticketCount;
  final DateTime createdAt;

  const Booking({
    required this.id,
    required this.paymentId,
    required this.eventId,
    required this.ticketType,
    required this.ticketCount,
    required this.createdAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}

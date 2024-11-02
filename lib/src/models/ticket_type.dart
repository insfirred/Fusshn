import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/enums.dart';

part 'ticket_type.g.dart';

@JsonSerializable()
class TicketType {
  final String id;
  final String name;
  final double price;
  final int personAllowed;
  final Gender personGender;
  final String description;
  final bool isRefundable;
  final int totalTickets;
  final int availableTickets;

  const TicketType({
    required this.id,
    required this.name,
    required this.price,
    required this.personAllowed,
    required this.personGender,
    required this.description,
    required this.isRefundable,
    required this.totalTickets,
    required this.availableTickets,
  });

  factory TicketType.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeFromJson(json);

  Map<String, dynamic> toJson() => _$TicketTypeToJson(this);
}

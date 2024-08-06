import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/enums.dart';

part 'ticket_type.g.dart';

@JsonSerializable()
class TicketType {
  // firestore keys
  static String idKey = 'id';
  static String nameKey = 'name';
  static String priceKey = 'price';
  static String personAllowedKey = 'person_allowed';
  static String personGenderKey = 'person_gender';
  static String descriptionKey = 'description';
  static String isRefundableKey = 'phone';
  static String totalTicketsKey = 'total_tickets';
  static String availableTicketsKey = 'available_tickets';

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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketType _$TicketTypeFromJson(Map<String, dynamic> json) => TicketType(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      personAllowed: json['personAllowed'] as int,
      personGender: $enumDecode(_$GenderEnumMap, json['personGender']),
      description: json['description'] as String,
      isRefundable: json['isRefundable'] as bool,
      totalTickets: json['totalTickets'] as int,
      availableTickets: json['availableTickets'] as int,
    );

Map<String, dynamic> _$TicketTypeToJson(TicketType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'personAllowed': instance.personAllowed,
      'personGender': _$GenderEnumMap[instance.personGender]!,
      'description': instance.description,
      'isRefundable': instance.isRefundable,
      'totalTickets': instance.totalTickets,
      'availableTickets': instance.availableTickets,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
  Gender.preferNotToSay: 'preferNotToSay',
};

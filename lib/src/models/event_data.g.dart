// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventData _$EventDataFromJson(Map<String, dynamic> json) => EventData(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      artistLineup: (json['artistLineup'] as List<dynamic>)
          .map((e) => ArtistData.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventLocation: json['eventLocation'] as String,
      posterUrl: json['posterUrl'] as String,
      imagesUrls: (json['imagesUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      tickets: (json['tickets'] as List<dynamic>)
          .map((e) => TicketType.fromJson(e as Map<String, dynamic>))
          .toList(),
      ageRestrictions: json['ageRestrictions'] as int,
      organiserName: json['organiserName'] as String,
      termsAndConditions: (json['termsAndConditions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EventDataToJson(EventData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'artistLineup': instance.artistLineup,
      'eventLocation': instance.eventLocation,
      'posterUrl': instance.posterUrl,
      'imagesUrls': instance.imagesUrls,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'tickets': instance.tickets,
      'ageRestrictions': instance.ageRestrictions,
      'organiserName': instance.organiserName,
      'termsAndConditions': instance.termsAndConditions,
      'tags': instance.tags,
    };

import 'package:freezed_annotation/freezed_annotation.dart';

import 'artist_data.dart';
import 'coordinates_data.dart';
import 'ticket_type.dart';

part 'event_data.g.dart';

@JsonSerializable()
class EventData {
  final String id;
  final String name;
  final String description;
  final List<ArtistData> artistLineup;
  final String eventLocationText;
  final CoordinatesData eventLocationCoordinates;
  final String posterUrl;
  final List<String> imagesUrls;
  final DateTime startTime;
  final DateTime endTime;
  final List<TicketType> tickets;
  final int ageRestrictions;
  final String organiserName;
  final List<String> termsAndConditions;
  final List<String> tags;

  const EventData({
    required this.id,
    required this.name,
    required this.description,
    required this.artistLineup,
    required this.eventLocationText,
    required this.eventLocationCoordinates,
    required this.posterUrl,
    required this.imagesUrls,
    required this.startTime,
    required this.endTime,
    required this.tickets,
    required this.ageRestrictions,
    required this.organiserName,
    required this.termsAndConditions,
    required this.tags,
  });

  factory EventData.fromJson(Map<String, dynamic> json) =>
      _$EventDataFromJson(json);

  Map<String, dynamic> toJson() => _$EventDataToJson(this);
}

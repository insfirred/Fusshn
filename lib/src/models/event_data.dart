import 'package:freezed_annotation/freezed_annotation.dart';

import 'artist_data.dart';
import 'ticket_type.dart';

part 'event_data.g.dart';

@JsonSerializable()
class EventData {
  // firestore keys
  static String userCollectionKey = 'events';
  static String uidKey = 'id';
  static String nameKey = 'name';
  static String descriptionKey = 'description';
  static String categoryKey = 'category';
  static String genreKey = 'genre';
  static String artistLineupKey = 'artist_lineup';
  static String locationKey = 'location';
  static String posterUrlKey = 'poster_url';
  static String imagesUrlsKey = 'images_urls';
  static String startTimeKey = 'start_time';
  static String endTimeKey = 'end_time';
  static String gateClosingTimeKey = 'gate_closing_time';
  static String ticketsKey = 'tickets';
  static String restrictedAgeKey = 'restricted_age';
  static String organiserNameKey = 'organiser_name';
  static String termsAndConditionsKey = 'terms_and_conditions';

  final String id;
  final String name;
  final String description;
  final String category;
  final String eventGenre;
  final List<ArtistData> artistLineup;
  final String eventLocation;
  final String posterUrl;
  final List<String> imagesUrls;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime gateCloseTime;
  final List<TicketType> tickets;
  final int ageRestrictions;
  final String organiserName;
  final List<String> termsAndConditions;

  const EventData({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.eventGenre,
    required this.artistLineup,
    required this.eventLocation,
    required this.posterUrl,
    required this.imagesUrls,
    required this.startTime,
    required this.endTime,
    required this.gateCloseTime,
    required this.tickets,
    required this.ageRestrictions,
    required this.organiserName,
    required this.termsAndConditions,
  });

  factory EventData.fromJson(Map<String, dynamic> json) =>
      _$EventDataFromJson(json);

  Map<String, dynamic> toJson() => _$EventDataToJson(this);
}

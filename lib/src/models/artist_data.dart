import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_data.g.dart';

@JsonSerializable()
class ArtistData {
  // firestore keys
  static String idKey = 'id';
  static String nameKey = 'name';
  static String imageUrlKey = 'image_url';

  final String id;
  final String name;
  final String imageUrl;

  const ArtistData({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory ArtistData.fromJson(Map<String, dynamic> json) =>
      _$ArtistDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDataToJson(this);
}

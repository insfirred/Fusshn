// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistData _$ArtistDataFromJson(Map<String, dynamic> json) => ArtistData(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$ArtistDataToJson(ArtistData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };

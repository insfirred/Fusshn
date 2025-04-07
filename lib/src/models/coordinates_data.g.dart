// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesData _$CoordinatesDataFromJson(Map<String, dynamic> json) =>
    CoordinatesData(
      lattitude: (json['lattitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinatesDataToJson(CoordinatesData instance) =>
    <String, dynamic>{
      'lattitude': instance.lattitude,
      'longitude': instance.longitude,
    };

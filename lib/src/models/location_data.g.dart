// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationData _$LocationDataFromJson(Map<String, dynamic> json) => LocationData(
      city: json['city'] as String,
      pincode: json['pincode'] as String,
      lattitide: json['lattitide'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'city': instance.city,
      'pincode': instance.pincode,
      'lattitide': instance.lattitide,
      'longitude': instance.longitude,
    };

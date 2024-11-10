import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_data.g.dart';

@JsonSerializable()
class LocationData {
  final String city;
  final String pincode;
  final String lattitide;
  final String longitude;

  const LocationData({
    required this.city,
    required this.pincode,
    required this.lattitide,
    required this.longitude,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);
}

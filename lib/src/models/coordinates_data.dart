import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinates_data.g.dart';

@JsonSerializable()
class CoordinatesData {
  final double lattitude;
  final double longitude;

  const CoordinatesData({
    required this.lattitude,
    required this.longitude,
  });

  factory CoordinatesData.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesDataFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesDataToJson(this);
}


// Bellandur SOCIAL, Kadubisanahalli, Bengaluru
// 12.937030, 77.695977



// Toit, 100ft Road, Indiranagar, Bengaluru
// 12.979286, 77.640600


// SOHO Delhi, Panchsheel Marg, Chanakyapuri, New Delhi
// 28.595672, 77.196573


// Ru-Ba-Ru 2, Gardens Galleria, Entertainment City, Sector 38 A, Noida
// 28.564658, 77.321467
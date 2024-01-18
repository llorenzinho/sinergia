import 'package:sinergia/features/cities/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  CityModel(
      {required super.name,
      required super.otherName,
      required super.provinceShortName,
      required super.provinceName,
      required super.regionCode,
      required super.regionName,
      required super.cap,
      required super.lat,
      required super.lon,
      required super.fileIds});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    var fileIds = json['fileIds'] ?? [];
    return CityModel(
        name: json['name'] as String,
        otherName: json['otherName'] ?? '',
        cap: json['cap'] as String,
        lat: json['lat'] as double,
        lon: json['lon'] as double,
        provinceShortName: json['provinceShortName'] ?? '',
        provinceName: json['provinceName'] as String,
        regionCode: json['regionCode'] as String,
        regionName: json['regionName'] as String,
        fileIds: (fileIds as List<dynamic>).map((e) => e.toString()).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'otherName': otherName,
      'cap': cap,
      'lat': lat,
      'lon': lon,
      'provinceShortName': provinceShortName,
      'provinceName': provinceName,
      'regionCode': regionCode,
      'regionName': regionName,
      'fileIds': fileIds
    };
  }
}

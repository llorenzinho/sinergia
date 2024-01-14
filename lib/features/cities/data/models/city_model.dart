import 'package:sinergia/features/cities/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  const CityModel(
      {required super.name,
      required super.provinceId,
      required super.provinceName,
      required super.fileIds,
      required super.regionId,
      required super.regionName});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        name: json['name'] as String,
        provinceId: json['provinceId'] ?? '',
        provinceName: json['provinceName'] as String,
        regionId: json['regionId'] as String,
        regionName: json['regionName'] as String,
        fileIds: (json['fileIds'] as List<dynamic>)
            .map((e) => e.toString())
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'provinceId': provinceId,
      'provinceName': provinceName,
      'regionId': regionId,
      'regionName': regionName,
      'fileIds': fileIds,
    };
  }
}

import 'package:sinergia/features/cities/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  const CityModel(
      {required super.name,
      required super.provinceId,
      required super.provinceName,
      required super.fileIds,
      required super.regionCode,
      required super.regionName});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    var fileIds = json['fileIds'] ?? [];
    return CityModel(
        name: json['name'] as String,
        provinceId: json['provinceId'] ?? '',
        provinceName: json['provinceName'] as String,
        regionCode: json['regionCode'] as String,
        regionName: json['regionName'] as String,
        fileIds: (fileIds as List<dynamic>).map((e) => e.toString()).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'provinceId': provinceId,
      'provinceName': provinceName,
      'regionCode': regionCode,
      'regionName': regionName,
      'fileIds': fileIds,
    };
  }
}

import 'package:sinergia/features/cities/domain/entities/city_entity.dart';

abstract class CityRepository {
  Future<List<CityEntity>> getBy(
      {String? provinceId,
      String? provinceName,
      String? name,
      String? id,
      String? regionName,
      String? regionId});
  Future<List<CityEntity>> getAll();
  Future<List<CityEntity>> getByRegionID(String regionID);
  Future<List<CityEntity>> getByRegionName(String regionName);

  Future<CityEntity?> get(String id);
  Future<CityEntity?> update(String id, CityEntity city);
  Future<CityEntity?> addFile(String id, String fileID);
}

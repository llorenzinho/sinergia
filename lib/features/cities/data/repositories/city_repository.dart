import 'package:sinergia/features/cities/data/datasources/city_firestore_ds.dart';
import 'package:sinergia/features/cities/data/models/city_model.dart';
import 'package:sinergia/features/cities/domain/entities/city_entity.dart';
import 'package:sinergia/features/cities/domain/repositories/city_repository.dart';

class CityRepositoryImpl extends CityRepository {
  final CityDatasource ds;

  CityRepositoryImpl({required this.ds});

  @override
  Future<CityModel?> addFile(String id, String fileID) {
    return ds.addFile(id, fileID);
  }

  @override
  Future<CityModel?> get(String id) {
    return ds.get(id);
  }

  @override
  Future<List<CityModel>> getAll() {
    return ds.getAll();
  }

  @override
  Future<List<CityModel>> getByRegionID(String regionID) {
    return ds.getByRegionCode(regionID);
  }

  @override
  Future<List<CityModel>> getByRegionName(String regionName) {
    return ds.getByRegionName(regionName);
  }

  @override
  Future<CityModel?> update(String id, CityEntity city) {
    return ds.update(id, city as CityModel);
  }

  @override
  Future<List<CityModel>> getBy(
      {String? provinceId,
      String? provinceName,
      String? name,
      String? id,
      String? regionName,
      String? regionCode}) {
    // TODO: implement getBy
    throw UnimplementedError();
  }
}

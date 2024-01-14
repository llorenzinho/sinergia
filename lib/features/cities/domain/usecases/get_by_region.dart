import 'package:sinergia/features/cities/domain/entities/city_entity.dart';
import 'package:sinergia/features/cities/domain/usecases/base.dart';

class GetCityByRegionUC extends CityUC<List<CityEntity>, String> {
  GetCityByRegionUC({required repository}) : super(repository: repository);

  @override
  Future<List<CityEntity>> call(String parameters) {
    return repository.getByRegionID(parameters);
  }
}

import 'package:sinergia/core/usecase/use_case.dart';
import 'package:sinergia/features/cities/domain/repositories/city_repository.dart';

abstract class CityUC<Type, Params> extends UseCase<Type, Params> {
  final CityRepository repository;

  CityUC({required this.repository});
}

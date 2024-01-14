import 'package:get_it/get_it.dart';
import 'package:sinergia/features/cities/data/datasources/city_firestore_ds.dart';
import 'package:sinergia/features/cities/data/repositories/city_repository.dart';
import 'package:sinergia/features/cities/domain/usecases/get_by_region.dart';
import 'package:sinergia/features/cities/presentation/bloc/cities_bloc.dart';
import 'package:sinergia/features/select_region/presentation/cubit/select_region_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  // Data sources
  sl.registerSingleton<CityDatasource>(CityDatasource());

  // Repositories
  sl.registerSingleton<CityRepositoryImpl>(
      CityRepositoryImpl(ds: sl<CityDatasource>()));

  // Use cases
  sl.registerSingleton<GetCityByRegionUC>(
      GetCityByRegionUC(repository: sl<CityRepositoryImpl>()));

  // Blocs
  sl.registerFactory<SelectRegionCubit>(() => SelectRegionCubit());
  sl.registerFactory(() => CitiesBloc(sl<GetCityByRegionUC>()));
}

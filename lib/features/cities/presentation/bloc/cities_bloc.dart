import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sinergia/features/cities/domain/entities/city_entity.dart';
import 'package:sinergia/features/cities/domain/usecases/get_by_region.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final GetCityByRegionUC getByRegionCodeUC;

  CitiesBloc(this.getByRegionCodeUC) : super(CitiesInitial()) {
    on<CitiesRequested>(_getCities);
  }

  FutureOr<void> _getCities(
      CitiesRequested event, Emitter<CitiesState> emit) async {
    emit(CitiesLoading());
    try {
      final List<CityEntity> cities = await getByRegionCodeUC(event.regionID);
      emit(CitiesLoaded(cities: cities));
    } catch (e) {
      emit(CitiesError(message: e.toString()));
    }
  }
}

part of 'cities_bloc.dart';

abstract class CitiesState extends Equatable {
  const CitiesState();

  @override
  List<Object> get props => [];
}

class CitiesInitial extends CitiesState {}

class CitiesError extends CitiesState {
  final String message;

  const CitiesError({required this.message});

  @override
  List<Object> get props => [message];
}

class CitiesLoading extends CitiesState {}

class CitiesLoaded extends CitiesState {
  final List<CityEntity> cities;

  const CitiesLoaded({required this.cities});

  @override
  List<Object> get props => [cities];
}

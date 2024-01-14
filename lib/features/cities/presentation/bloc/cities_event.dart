part of 'cities_bloc.dart';

abstract class CitiesEvent extends Equatable {
  const CitiesEvent();

  @override
  List<Object> get props => [];
}

class CitiesRequested extends CitiesEvent {
  final String regionID;

  const CitiesRequested({required this.regionID});

  @override
  List<Object> get props => [regionID];
}

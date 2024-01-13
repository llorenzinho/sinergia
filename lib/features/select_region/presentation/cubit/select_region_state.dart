part of 'select_region_cubit.dart';

abstract class SelectRegionState extends Equatable {
  const SelectRegionState({this.selectedRegion = ''});
  final String selectedRegion;

  @override
  List<Object> get props => [selectedRegion];
}

class SelectRegionInitial extends SelectRegionState {
  const SelectRegionInitial();
}

class SelectRegion extends SelectRegionState {
  const SelectRegion({required super.selectedRegion});
}

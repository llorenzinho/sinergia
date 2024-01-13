import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_region_state.dart';

class SelectRegionCubit extends Cubit<SelectRegionState> {
  SelectRegionCubit() : super(const SelectRegionInitial());

  void selectRegion(String region) {
    emit(SelectRegion(selectedRegion: region));
  }
}

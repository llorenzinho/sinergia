import 'package:get_it/get_it.dart';
import 'package:sinergia/features/select_region/presentation/cubit/select_region_cubit.dart';

final GetIt sl = GetIt.instance;

void initDependencies() {
  // Region state management
  sl.registerSingleton<SelectRegionCubit>(SelectRegionCubit());
}

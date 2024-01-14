import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinergia/features/cities/presentation/bloc/cities_bloc.dart';
import 'package:sinergia/features/cities/presentation/widgets/cities_table.dart';
import 'package:sinergia/features/select_region/presentation/cubit/select_region_cubit.dart';

class RegionTableContainer extends StatelessWidget {
  const RegionTableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final regionState = context.watch<SelectRegionCubit>().state;
      final cityState = context.watch<CitiesBloc>().state;

      if (regionState is SelectRegion) {
        if (cityState is CitiesInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (cityState is CitiesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (cityState is CitiesLoaded) {
          return cityState.cities.isEmpty
              ? const Center(child: Text('Nessuna città trovata'))
              : CityTable(cities: cityState.cities);
        } else if (cityState is CitiesError) {
          return Center(child: Text(cityState.message));
        }
      }

      return const Center(child: Text('Seleziona una regione'));
    });
  }
}

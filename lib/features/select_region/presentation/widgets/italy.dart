import 'package:countries_world_map/countries_world_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinergia/features/cities/presentation/bloc/cities_bloc.dart';
import 'package:sinergia/features/select_region/presentation/cubit/select_region_cubit.dart';

class ItalyMap extends StatefulWidget {
  const ItalyMap({super.key});

  @override
  State<ItalyMap> createState() => _ItalyMapState();
}

class _ItalyMapState extends State<ItalyMap> {
  SMapItalyColors _colors = SMapItalyColors();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) => _setColor());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesBloc, CitiesState>(
      builder: (context, state) =>
          BlocBuilder<SelectRegionCubit, SelectRegionState>(
              builder: (context, state) {
        return SimpleMap(
            countryBorder: CountryBorder(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: 1.0,
            ),
            instructions: SMapItaly.instructions,
            defaultColor: Theme.of(context).colorScheme.primary,
            colors: _colors.toMap(),
            callback: _selectRegion);
      }),
    );
  }

  void _selectRegion(String id, String name, TapUpDetails tapDetails) {
    if (!id.startsWith("IT")) return;
    BlocProvider.of<SelectRegionCubit>(context).selectRegion(name);
    BlocProvider.of<CitiesBloc>(context).add(CitiesRequested(regionID: id));
    _setColor(id: id);
  }

  void _setColor({String? id}) {
    setState(() {
      final Map<String, Color> whiteMap = {
        'FR-H': Theme.of(context).scaffoldBackgroundColor
      };
      if (id != null) whiteMap[id] = Theme.of(context).colorScheme.secondary;
      _colors = SMapItalyColors.fromMap(whiteMap);
    });
  }
}

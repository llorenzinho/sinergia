import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinergia/features/select_region/presentation/cubit/select_region_cubit.dart';

class RegionText extends StatelessWidget {
  const RegionText({super.key, this.prefix});
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectRegionCubit, SelectRegionState>(
        builder: (BuildContext context, SelectRegionState state) {
      String region = '';
      if (state is SelectRegion) {
        region = state.selectedRegion;
      }
      final String text = prefix != null ? '$prefix $region' : region;
      return Text(text);
    });
  }
}

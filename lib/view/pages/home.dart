import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinergia/features/select_region/presentation/cubit/select_region_cubit.dart';
import 'package:sinergia/features/select_region/presentation/widgets/italy.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sinergia App'),
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: ItalyMap()),
                    Expanded(
                      child: BlocBuilder<SelectRegionCubit, SelectRegionState>(
                          builder: (context, state) {
                        if (state is SelectRegion) {
                          return Text(
                              'Selected region: ${state.selectedRegion}');
                        }
                        return const Text('Select a region');
                      }),
                    ),
                  ],
                ))));
  }
}

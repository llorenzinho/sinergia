import 'package:flutter/material.dart';
import 'package:sinergia/features/cities/presentation/widgets/table_container.dart';
import 'package:sinergia/features/select_region/presentation/widgets/italy.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sinergia App'),
        ),
        body: const Center(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: ItalyMap()),
                    Expanded(child: RegionTableContainer()),
                  ],
                ))));
  }
}

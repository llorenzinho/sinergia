import 'package:flutter/material.dart';
import 'package:sinergia/features/cities/domain/entities/city_entity.dart';
import 'package:sinergia/features/cities/utils/table_data_source.dart';

class CityTable extends StatelessWidget {
  const CityTable({super.key, required this.cities});

  final List<CityEntity> cities;

  @override
  Widget build(BuildContext context) {
    final tableDataSource = CitiesTableDataSource(cities: cities);
    return PaginatedDataTable(columns: const [
      DataColumn(label: Text('Nome')),
      DataColumn(label: Text('Provincia')),
      DataColumn(label: Text('Regione')),
      DataColumn(label: Text('Files')),
    ], source: tableDataSource);
  }
}

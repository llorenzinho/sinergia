import 'package:flutter/material.dart';
import 'package:sinergia/features/cities/domain/entities/city_entity.dart';

class CitiesTableDataSource extends DataTableSource {
  final List<CityEntity> cities;

  CitiesTableDataSource({required this.cities});

  @override
  DataRow? getRow(int index) {
    final city = cities[index];
    return DataRow(cells: [
      DataCell(Text(city.name)), // name
      DataCell(Text(city.provinceName)), // province
      DataCell(Text(city.regionName)), // region
      DataCell(Text(city.fileIds.length.toString())) // files count
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => cities.length;

  @override
  int get selectedRowCount => 0;
}

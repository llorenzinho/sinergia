import 'package:flutter/material.dart';
import 'package:sinergia/features/cities/domain/entities/city_entity.dart';
import 'package:sinergia/features/documents/presentation/pages/test_page.dart';

class CitiesTableDataSource extends DataTableSource {
  final List<CityEntity> cities;

  CitiesTableDataSource({required this.cities, required this.buildctx});
  final BuildContext buildctx;

  @override
  DataRow? getRow(int index) {
    final city = cities[index];
    return DataRow(cells: [
      DataCell(
        Text(city.name),
        onTap: () => Navigator.push(buildctx,
            MaterialPageRoute(builder: (context) => Test(city: city.name))),
      ), // name
      DataCell(Text(city.provinceName)), // province
      DataCell(Text(city.cap)), // cap
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

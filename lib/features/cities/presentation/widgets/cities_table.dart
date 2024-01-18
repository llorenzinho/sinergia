import 'package:flutter/material.dart';
import 'package:sinergia/features/cities/domain/entities/city_entity.dart';
import 'package:sinergia/features/cities/utils/table_data_source.dart';

class CityTable extends StatefulWidget {
  const CityTable({super.key, required this.cities, this.withSearch});

  final List<CityEntity> cities;
  final bool? withSearch;

  @override
  State<CityTable> createState() => _CityTableState();
}

class _CityTableState extends State<CityTable> {
  final TextEditingController _searchController = TextEditingController();
  late List<CityEntity> _filteredCities;
  bool _nameAscending = false;
  bool _provinceAscending = false;

  @override
  void initState() {
    super.initState();
    _filteredCities = widget.cities;
  }

  void _filter(String text) {
    setState(() {
      _filteredCities = widget.cities
          .where((city) =>
              city.name.toLowerCase().contains(text.toLowerCase()) ||
              // city.provinceName.toLowerCase().contains(text.toLowerCase()) ||
              city.provinceId.toUpperCase().contains(text.toUpperCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tableDataSource = CitiesTableDataSource(cities: _filteredCities);
    return SingleChildScrollView(
      child: PaginatedDataTable(
          columns: [
            DataColumn(
                label: const Text("Nome"),
                onSort: (columnIndex, ascending) {
                  setState(() {
                    _filteredCities.sort((a, b) => a.name.compareTo(b.name));
                    if (_nameAscending) {
                      _filteredCities = _filteredCities.reversed.toList();
                    }
                    _nameAscending = !_nameAscending;
                  });
                }),
            DataColumn(
                label: const Text('Provincia'),
                onSort: (columnIndex, ascending) {
                  setState(() {
                    _filteredCities.sort(
                        (a, b) => a.provinceName.compareTo(b.provinceName));
                    if (_provinceAscending) {
                      _filteredCities = _filteredCities.reversed.toList();
                    }
                    _provinceAscending = !_provinceAscending;
                  });
                }),
            const DataColumn(label: Text('Regione')),
            const DataColumn(label: Text('Files')),
          ],
          source: tableDataSource,
          rowsPerPage: 10,
          header: Row(
            children: [
              const Text("Città"),
              const Spacer(),
              if (widget.withSearch ?? true)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Cerca',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),
                      ),
                      onChanged: _filter,
                    ),
                  ),
                ),
            ],
          )),
    );
  }
}

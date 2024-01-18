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
  bool _nameAscending = true;
  bool _provinceAscending = true;

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
              city.cap.contains(text) ||
              city.provinceShortName.toUpperCase().contains(text.toUpperCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tableDataSource =
        CitiesTableDataSource(cities: _filteredCities, buildctx: context);
    return SingleChildScrollView(
      child: PaginatedDataTable(
        columns: _getColums,
        key: UniqueKey(),
        source: tableDataSource,
        rowsPerPage: 10,
        header: const Text("Città"),
        actions: _getActions,
      ),
    );
  }

  List<Widget> get _getActions {
    return <Widget>[
      SizedBox(
        width: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: TextField(
            controller: _searchController,
            autofocus: true,
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
      IconButton(
          onPressed: () {
            setState(() {
              _filteredCities = widget.cities;
              _searchController.clear();
            });
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  List<DataColumn> get _getColums {
    return [
      DataColumn(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                _nameAscending
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                size: 14,
              ),
              const Text('Nome')
            ],
          ),
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
              _filteredCities
                  .sort((a, b) => a.provinceName.compareTo(b.provinceName));
              if (_provinceAscending) {
                _filteredCities = _filteredCities.reversed.toList();
              }
              _provinceAscending = !_provinceAscending;
            });
          }),
      const DataColumn(label: Text('CAP')),
      const DataColumn(label: Text('Files'), numeric: true),
    ];
  }
}

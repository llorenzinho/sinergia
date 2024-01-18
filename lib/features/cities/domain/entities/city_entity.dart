abstract class CityEntity {
  final String name;
  final String otherName;
  final String provinceShortName;
  final String provinceName;
  final String regionCode;
  final String regionName;
  final String cap;
  final double lat;
  final double lon;
  final List<String> fileIds;

  CityEntity(
      {required this.name,
      required this.otherName,
      required this.provinceShortName,
      required this.provinceName,
      required this.regionCode,
      required this.regionName,
      required this.cap,
      required this.lat,
      required this.lon,
      required this.fileIds});
}

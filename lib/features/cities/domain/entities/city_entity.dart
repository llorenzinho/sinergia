abstract class CityEntity {
  final String name;
  final String provinceId;
  final String provinceName;
  final String regionCode;
  final String regionName;
  final List<String> fileIds;

  const CityEntity(
      {required this.name,
      required this.provinceId,
      required this.provinceName,
      required this.regionCode,
      required this.regionName,
      required this.fileIds});
}

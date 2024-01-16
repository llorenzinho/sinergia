import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinergia/core/costants/firestore_collections.dart';
import 'package:sinergia/features/cities/data/models/city_model.dart';

class CityDatasource {
  final CollectionReference _cities =
      FirebaseFirestore.instance.collection(FirestoreCollections.city);

  Future<CityModel?> get(String id) {
    return _cities.doc(id).get().then((value) {
      if (value.exists) {
        return CityModel.fromJson(value.data()! as Map<String, dynamic>);
      } else {
        return null;
      }
    });
  }

  Future<CityModel?> update(String id, CityModel city) {
    return _cities.doc(id).update(city.toJson()).then((value) {
      return city;
    });
  }

  Future<CityModel?> addFile(String id, String fileID) {
    return _cities.doc(id).update({
      'fileIds': FieldValue.arrayUnion([fileID])
    }).then((value) {
      return get(id);
    });
  }

  Future<List<CityModel>> getAll() {
    return _cities.get().then((value) {
      return value.docs
          .map((e) => CityModel.fromJson(e.data()! as Map<String, dynamic>))
          .toList();
    });
  }

  Future<List<CityModel>> getByRegionCode(String regionCode) async {
    return _cities.where('regionCode', isEqualTo: regionCode).get().then(
        (value) => value.docs
            .map((e) => CityModel.fromJson(e.data()! as Map<String, dynamic>))
            .toList());
  }

  Future<List<CityModel>> getByRegionName(String regionName) {
    return _cities.where('regionName', isEqualTo: regionName).get().then(
        (value) => value.docs
            .map((e) => CityModel.fromJson(e.data()! as Map<String, dynamic>))
            .toList());
  }
}

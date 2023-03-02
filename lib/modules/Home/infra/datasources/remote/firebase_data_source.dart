import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import 'package:my_sesion/modules/Home/infra/datasources/datasource.dart';

class FirebaseDataSource implements DataSource {
  final FirebaseDatabase _db = FirebaseDatabase.instance;
  @override
  Future<void> deleteSesion(Map<String, dynamic> sesion) {
    // TODO: implement deleteSesion
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getSesions() async {
    DatabaseEvent event =
        await _db.ref("sesions").once(DatabaseEventType.value);
    final hashMap = event.snapshot.value;

    var jsonDecoded = json.decode(json.encode(hashMap)) as Map<String, dynamic>;
    var listSesionDynamic = jsonDecoded.values.toList();
    var listSesionMap =
        listSesionDynamic.map((e) => Map<String, dynamic>.from(e)).toList();
    return listSesionMap;
  }

  @override
  Future<void> saveSesion(Map<String, dynamic> sesion) {
    // TODO: implement saveSesion
    throw UnimplementedError();
  }

  @override
  Future<void> updateSesion(Map<String, dynamic> sesion) {
    // TODO: implement updateSesion
    throw UnimplementedError();
  }
}

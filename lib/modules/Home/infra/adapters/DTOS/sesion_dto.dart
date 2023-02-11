import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';

abstract class SesionDTO {
  static Map<String, dynamic> toMap(Sesion sesion) {
    return {
      'description': sesion.description,
      'data': sesion.data.toString(),
    };
  }

  static Sesion fromMap(Map<String, dynamic> sesion) {
    return Sesion(
      description: sesion['description'],
      data: DateTime.parse(sesion['data']).toString(),
    );
  }
}

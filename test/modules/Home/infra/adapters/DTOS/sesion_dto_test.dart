import 'package:flutter_test/flutter_test.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/infra/adapters/DTOS/sesion_dto.dart';

void main() {
  test('Should return a map from a sesion', () {
    var data = DateTime.now().toString();
    var sesion = Sesion(description: 'description', data: data);
    var map = SesionDTO.toMap(sesion);
    expect(map['description'], equals("description"));
    expect(map['data'], equals(data));
  });

  test('Should return a sesion from a map', () {
    var data = DateTime.now().toString();
    var map = {
      'description': 'description',
      'data': data,
    };
    var sesion = SesionDTO.fromMap(map);
    expect(sesion.description, equals('description'));
    expect(sesion.data, equals(data));
  });
}

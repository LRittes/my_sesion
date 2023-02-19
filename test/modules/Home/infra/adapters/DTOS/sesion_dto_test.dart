import 'package:flutter_test/flutter_test.dart';
import 'package:my_sesion/modules/Home/domain/entities/exercise.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/infra/adapters/DTOS/sesion_dto.dart';

void main() {
  test('Should return a map from a sesion', () {
    var date = DateTime.now().toString();
    var sesion = Sesion(description: 'description', date: date, exercises: [
      Exercise(
        description: 'description',
        reps: 1,
        sets: 2,
        weightPerSet: {'1': 9, '2': 3},
        image: null,
        video: null,
      )
    ]);
    var map = SesionDTO.toMap(sesion);
    expect(map['description'], equals("description"));
    expect(map['date'], equals(date));
    expect(map['exercises'], isA<Map>());
    expect(map['exercises']['0']['description'], equals('description'));
  });

  test('Should return a sesion from a map', () {
    var date = DateTime.now().toString();
    var map = {
      'description': 'description',
      'date': date,
      'exercises': {
        '0': {
          'description': 'description1',
          'sets': '1',
          'reps': '1',
          'weightPerSet': {'1': 2},
          'video': null,
          'image': null,
        }
      }
    };
    var sesion = SesionDTO.fromMap(map);
    expect(sesion.description, equals('description'));
    expect(sesion.date, equals(date));
    expect(sesion.exercises, isA<List<Exercise>>());
    expect(sesion.exercises[0].description, equals('description1'));
  });
}

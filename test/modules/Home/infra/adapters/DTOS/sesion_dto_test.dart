import 'package:flutter_test/flutter_test.dart';
import 'package:my_sesion/modules/Home/domain/entities/exercise.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/infra/adapters/DTOS/sesion_dto.dart';
import 'package:my_sesion/modules/shared/utils/functions/format_data.dart';

void main() {
  test('Should return a map from a sesion', () {
    var date = DateTime.now();
    var sesion = Sesion(description: 'description', date: date, exercises: [
      Exercise(
        description: 'description',
        reps: 1,
        sets: 2,
        weightPerSet: [9, 3],
        image: null,
        video: null,
      )
    ]);
    var map = SesionDTO.toMap(sesion);
    expect(map[formatData(date)["dateToJson"]]['description'],
        equals("description"));
    expect(map[formatData(date)["dateToJson"]]['date'], equals(date));
    expect(map[formatData(date)["dateToJson"]]['exercises'], isA<Map>());
    expect(map[formatData(date)["dateToJson"]]['exercises']['0']['description'],
        equals('description'));
  });

  test('Should return a sesion from a map', () {
    var date = DateTime.now();
    var map = {
      'description': 'description',
      'date': date.toString(),
      'exercises': [
        {
          'description': 'description1',
          'sets': '1',
          'reps': '1',
          'weightPerSet': [2],
          'video': null,
          'image': null,
        },
        {
          'description': 'description2',
          'sets': '2',
          'reps': '2',
          'weightPerSet': [2, 1],
          'video': null,
          'image': null,
        }
      ]
    };
    var sesion = SesionDTO.fromMap(map);
    expect(sesion.description, equals('description'));
    expect(sesion.date, equals(date));
    expect(sesion.exercises, isA<List<Exercise>>());
    expect(sesion.exercises[0].description, equals('description1'));
    expect(sesion.exercises[1].description, equals('description2'));
  });
}
/*
{"description":"description2","date":"2023-02-19 22:38:44.911","exercises":{"0":{"description":"description2","sets":"2","reps":"2","weightPerSet":{"0":1,"1":3},"video":null,"image":null}}}
{"description":"Mesa Flexora","sets":"3","reps":"12","weightPerSet":{"0":30,"1":35,"3":40},"video":null,"image":null}
 */
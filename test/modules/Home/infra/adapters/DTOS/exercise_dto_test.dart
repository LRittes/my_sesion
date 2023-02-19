import 'package:flutter_test/flutter_test.dart';
import 'package:my_sesion/modules/Home/domain/entities/exercise.dart';
import 'package:my_sesion/modules/Home/infra/adapters/DTOS/exercise_dto.dart';

void main() {
  test('Should return a map from a exercise', () {
    var exercise = Exercise(
      description: 'description',
      reps: 1,
      sets: 2,
      weightPerSet: {'1': 9, '2': 3},
      image: null,
      video: null,
    );
    var map = ExerciseDTO.toMap(exercise);
    expect(map['description'], equals("description"));
    expect(map['reps'], equals('1'));
    expect(map['sets'], equals('2'));
    expect(map['weightPerSet']['1'], equals(9));
    expect(map['weightPerSet']['2'], equals(3));
  });

  test('Should return a exercise from a map', () {
    var map = {
      'description': 'description',
      'sets': '1',
      'reps': '1',
      'weightPerSet': {'1': 2},
      'video': null,
      'image': null,
    };
    var exercise = ExerciseDTO.fromMap(map);
    expect(exercise.description, equals('description'));
    expect(exercise.sets, equals(1));
    expect(exercise.reps, equals(1));
    expect(exercise.weightPerSet['1'], equals(2));
  });
}

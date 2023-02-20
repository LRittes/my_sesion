import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/infra/adapters/DTOS/exercise_dto.dart';

abstract class SesionDTO {
  static Map<String, dynamic> toMap(Sesion sesion) {
    return {
      'description': sesion.description,
      'date': sesion.date.toString(),
      'exercises': {
        for (var e in sesion.exercises)
          sesion.exercises.indexOf(e).toString(): ExerciseDTO.toMap(e)
      },
    };
  }

  static Sesion fromMap(Map<String, dynamic> sesion) {
    return Sesion(
      description: sesion['description'],
      date: sesion['date'],
      exercises: (sesion['exercises'] as List)
          .map((e) => ExerciseDTO.fromMap(e))
          .toList(),
    );
  }
}

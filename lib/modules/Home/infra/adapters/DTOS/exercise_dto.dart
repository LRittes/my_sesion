import 'package:my_sesion/modules/Home/domain/entities/exercise.dart';

abstract class ExerciseDTO {
  static Map<String, dynamic> toMap(Exercise exercise) {
    return {
      'description': exercise.description,
      'sets': exercise.sets.toString(),
      'reps': exercise.reps.toString(),
      'weightPerSet': exercise.weightPerSet,
      'video': exercise.video,
      'image': exercise.image,
    };
  }

  static Exercise fromMap(Map<String, dynamic> exercise) {
    return Exercise(
      description: exercise['description'],
      sets: int.parse(exercise['sets']),
      reps: int.parse(exercise['reps']),
      weightPerSet: exercise['weightPerSet'],
      video: exercise['video'],
      image: exercise['image'],
    );
  }
}

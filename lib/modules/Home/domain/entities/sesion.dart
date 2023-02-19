import 'package:my_sesion/modules/Home/domain/entities/exercise.dart';

class Sesion {
  final String description;
  final String date;
  final List<Exercise> exercises;

  Sesion({
    required this.exercises,
    required this.description,
    required this.date,
  });
}

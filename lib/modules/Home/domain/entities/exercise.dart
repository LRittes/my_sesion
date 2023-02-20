class Exercise {
  final String description;
  final int sets;
  final int reps;
  final List<int> weightPerSet;
  String? video;
  String? image;

  Exercise({
    required this.description,
    required this.sets,
    required this.reps,
    required this.weightPerSet,
    this.video,
    this.image,
  });
}

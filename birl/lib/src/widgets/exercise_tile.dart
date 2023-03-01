import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  const ExerciseTile({
    super.key,
    required this.sets,
    required this.reps,
    required this.weightEachSet,
    required this.description,
  });

  final String description;
  final int sets;
  final int reps;
  final List<int> weightEachSet;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    int index = 0;
    final List<Widget> weightEachSetWidget = weightEachSet.map((weight) {
      index++;
      return Text(
        "$indexª set - ${weight.toString()} kg",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: color.onPrimary),
      );
    }).toList();

    return Container(
      decoration: BoxDecoration(
          color: color.primary, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      child: ExpansionTile(
        title: Text(
          "${sets}x$reps $description",
          style: TextStyle(
            fontSize: 16,
            color: color.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        collapsedIconColor: color.onPrimary,
        expandedAlignment: Alignment.bottomLeft,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 24),
        children: [...weightEachSetWidget],
      ),
    );
  }
}

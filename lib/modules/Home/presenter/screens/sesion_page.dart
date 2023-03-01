import 'package:birl/birl.dart';
import 'package:flutter/material.dart';
import 'package:my_sesion/modules/Home/domain/entities/exercise.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/shared/utils/functions/format_data.dart';

class SesionPage extends StatefulWidget {
  const SesionPage({super.key});

  @override
  State<SesionPage> createState() => _SesionPageState();
}

class _SesionPageState extends State<SesionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  // Tween<IconData?> arrow =
  //     Tween(begin: Icons.arrow_downward, end: Icons.arrow_upward);
  IconData? arrow = Icons.arrow_downward;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    // arrow.animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    final sesion = ModalRoute.of(context)!.settings.arguments as Sesion;
    final color = Theme.of(context).colorScheme;
    final mapDate = formatData(sesion.date);
    final date = "${mapDate['weekDay']}, ${mapDate['date']}";

    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.secondary,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () =>
                            Navigator.popAndPushNamed(context, '/'),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: color.onPrimary,
                          size: 18,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.update,
                              color: color.onPrimary,
                              size: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_forever,
                              color: color.onPrimary,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Column(
                      children: [
                        Text(
                          sesion.description,
                          style: TextStyle(
                            color: color.onPrimary,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            color: color.onPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ExerciseTile(
                    reps: sesion.exercises.first.reps,
                    sets: sesion.exercises.first.sets,
                    description: sesion.exercises.first.description,
                    weightEachSet: sesion.exercises.first.weightPerSet,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

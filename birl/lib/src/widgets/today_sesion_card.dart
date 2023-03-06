import 'package:flutter/material.dart';

class TodaySesionCard extends StatelessWidget {
  const TodaySesionCard({
    Key? key,
    required this.description,
    required this.dates,
    this.onTap,
  }) : super(key: key);

  final String description;
  final Map<String, String> dates;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(builder: (ctx, constrait) {
        double maxWidth;
        double sizeView = MediaQuery.of(context).size.width;
        if (sizeView > 500) {
          maxWidth = 500;
        } else {
          maxWidth = sizeView;
        }
        return Center(
          child: Container(
            width: maxWidth,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${dates["weekDay"]}, ${dates["date"]}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

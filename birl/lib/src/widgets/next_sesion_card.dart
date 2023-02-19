import 'package:flutter/material.dart';

class NextSesionCard extends StatelessWidget {
  const NextSesionCard({
    Key? key,
    required this.description,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  final String description;
  final String date;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: LayoutBuilder(
          builder: ((context, constraint) {
            double maxWidth;
            double sizeView = MediaQuery.of(context).size.width;
            if (sizeView > 500) {
              maxWidth = 500;
            } else {
              maxWidth = sizeView;
            }
            return Container(
              width: maxWidth,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

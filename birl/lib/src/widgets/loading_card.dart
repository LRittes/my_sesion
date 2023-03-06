import 'package:birl/src/widgets/skelton.dart';
import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skelton(
      height: 120,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Skelton(
              height: 20,
              width: 120,
            ),
            Skelton(
              height: 50,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

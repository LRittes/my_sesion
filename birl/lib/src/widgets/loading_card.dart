import 'package:flutter/material.dart';
import 'package:birl/src/widgets/skelton.dart';
import 'package:shimmer/shimmer.dart';

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
          children: [
            Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.grey,
              child: const Skelton(
                height: 20,
                width: 120,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.grey,
              child: const Skelton(
                height: 50,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

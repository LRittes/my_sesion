import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.height,
    this.width,
    this.child,
  });

  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.09),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

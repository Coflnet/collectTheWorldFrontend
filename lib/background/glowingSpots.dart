import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class glowSpots extends StatelessWidget {
  final Alignment alignment;
  final double radius;

  glowSpots({required this.alignment, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
                center: alignment,
                radius: radius,
                colors: const [Color.fromRGBO(225, 99, 40, 1), Colors.transparent]),
          ),
          width: 300,
          height: 300,
        ));
  }
}

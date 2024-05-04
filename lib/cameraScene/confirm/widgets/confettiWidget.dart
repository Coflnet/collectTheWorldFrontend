import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CustomConfettiWidget extends StatefulWidget {
  final ConfettiController confettiController;

  CustomConfettiWidget({required this.confettiController});

  @override
  ConfettiWidgetState createState() => ConfettiWidgetState();
}

class ConfettiWidgetState extends State<CustomConfettiWidget> {
  
  

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: widget.confettiController,
      blastDirection: pi / 2,
      maxBlastForce: 5,
      minBlastForce: 1,
      emissionFrequency: 0.01,
      numberOfParticles: 30,
      shouldLoop: false,
      gravity: 0.05,
    );
  }
}

import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class RewardVariationConfetti extends StatelessWidget {
  final ConfettiController confettiController;

  const RewardVariationConfetti({super.key, required this.confettiController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: ConfettiWidget(
        confettiController: confettiController,
        blastDirection: pi / 2,
        maxBlastForce: 5,
        minBlastForce: 1,
        emissionFrequency: 0.01,
        numberOfParticles: 30,
        shouldLoop: false,
        gravity: 0.05,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BeTheFirstDailyWidget extends StatelessWidget {
  const BeTheFirstDailyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Be the first",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ],
    );
  }
}

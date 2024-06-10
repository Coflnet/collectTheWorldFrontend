import 'package:flutter/material.dart';

class DailyItemPopup extends StatelessWidget {
  const DailyItemPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(151, 129, 234, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        "Rewards 1000XP",
        style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white70),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DailyItemPopup extends StatelessWidget {
  const DailyItemPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(151, 129, 234, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        children: [
          Text(
            "Collect 7 images",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white70),
          ),
          Text(
            "Rewards 100XP",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

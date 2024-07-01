import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmingImageStreak extends StatelessWidget {
  final int dailStreakNum;

  const ConfirmingImageStreak({super.key, required this.dailStreakNum});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Row(
        children: [
          const Text(
            "🔥",
            style: TextStyle(fontSize: 29),
          ),
          Text("$dailStreakNum",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w600,
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyStreak extends StatefulWidget {
  final int dailStreakNum;

  const DailyStreak({required this.dailStreakNum});

  @override
  DailyStreakStreak createState() => DailyStreakStreak();
}

class DailyStreakStreak extends State<DailyStreak> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Row(
        children: [
          const Text("🔥", style: TextStyle(fontSize: 28),),
          Text("${widget.dailStreakNum}",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w600,
              ))
        ],
      ),
    );
  }
}

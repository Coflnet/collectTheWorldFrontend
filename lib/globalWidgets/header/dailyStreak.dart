import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyStreak extends StatefulWidget {
  @override
  DailyStreakStreak createState() => DailyStreakStreak();
}

class DailyStreakStreak extends State<DailyStreak> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.local_fire_department_outlined,
          size: 40,
          color: Colors.orangeAccent,
        ),
        Text(
          "15",
          style: TextStyle(fontSize: 25, color: Colors.white),
        )
      ],
    );
  }
}

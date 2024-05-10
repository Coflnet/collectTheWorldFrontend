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
    return Row(
      children: [
        const Icon(
          Icons.local_fire_department_outlined,
          size: 40,
          color: Colors.orangeAccent,
        ),
        Text(
          "${widget.dailStreakNum}",
          style: const TextStyle(fontSize: 25, color: Colors.white),
        )
      ],
    );
  }
}

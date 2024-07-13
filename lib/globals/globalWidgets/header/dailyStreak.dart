import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/globals/globalWidgets/header/dailyStreakCountDown.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyStreak extends StatefulWidget {
  final int dailyStreak;
  const DailyStreak({super.key, required this.dailyStreak});

  @override
  _DailyStreakState createState() => _DailyStreakState();
}

class _DailyStreakState extends State<DailyStreak> {
  int dailStreakNum = ProfileRetrevial().getStreak();

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      pressType: PressType.singleClick,
      barrierColor: Colors.transparent,
      menuBuilder: () => ClipRRect(
        child: Container(
          width: 140,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(151, 129, 234, 1),
              borderRadius: BorderRadius.circular(8)),
          child: DailyStreakCountDown()
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        child: Row(
          children: [
            const Text(
              "🔥",
              style: TextStyle(fontSize: 28),
            ),
            Text(
                "${(widget.dailyStreak == 0) ? dailStreakNum : widget.dailyStreak}",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w600,
                ))
          ],
        ),
      ),
    );
  }
}

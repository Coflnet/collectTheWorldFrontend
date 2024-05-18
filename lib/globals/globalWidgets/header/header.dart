import 'package:collect_the_world/globals/globalWidgets/header/currentPosition.dart';
import 'package:collect_the_world/globals/globalWidgets/header/dailyStreak.dart';
import 'package:collect_the_world/globals/globalWidgets/header/xpwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final int dailStreakNum;

  const CustomHeader({super.key, required this.dailStreakNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 28, 32, 44),
        border: Border(
            bottom: BorderSide(
                color: Color.fromARGB(255, 141, 141, 141), width: 2)),
      ),
      height: 105,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 52, 20, 0),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CurrentPosition(),
                DailyStreak(dailStreakNum: dailStreakNum,),
                XpWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

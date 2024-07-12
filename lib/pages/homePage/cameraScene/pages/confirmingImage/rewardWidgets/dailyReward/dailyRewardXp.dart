import 'package:flutter/material.dart';

class DailyRewardXp extends StatelessWidget {
  final int progress;
  const DailyRewardXp({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      child: Text(
        "+500 XP",
        style: TextStyle(
            color: (progress == 7) ? Colors.white : Colors.transparent,
            fontSize: 22,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

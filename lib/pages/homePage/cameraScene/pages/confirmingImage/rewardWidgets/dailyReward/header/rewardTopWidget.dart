import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyReward/header/confirmingImageSkips.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyReward/header/confirmingImageStreak.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyReward/header/confirmingImageXp.dart';
import 'package:flutter/material.dart';

class RewardTopWidget extends StatelessWidget {
  final int streak;
  final int score;
  final int skips;

  const RewardTopWidget(
      {super.key,
      required this.streak,
      required this.score,
      required this.skips});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: baseWidget(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 19),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConfirmingImageXp(xp: score),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  ConfirmingImageSkips(remainingSkips: skips),
                  const SizedBox(width: 70),
                  ConfirmingImageStreak(dailStreakNum: streak)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

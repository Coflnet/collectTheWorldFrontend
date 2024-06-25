import 'package:collect_the_world/globals/globalScripts/cachingScripts/multiplierCaching.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/baseReward.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyItemQuestReward.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyReward.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/multipliers.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/rewardsHeader.dart';
import 'package:flutter/material.dart';

class DisplayRewards extends StatefulWidget {
  const DisplayRewards({super.key});

  @override
  _DisplayRewardsState createState() => _DisplayRewardsState();
}

class _DisplayRewardsState extends State<DisplayRewards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.70,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: baseWidget(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: const Column(
          children: <Widget>[
            RewardsHeader(dailyStreak: 1, totalScore: 250),
            SingleChildScrollView(
              child: Column(
                children: [
                  BaseReward(baseReward: 250),
                  Multipliers(multi: 1.25),
                  DailyReward(progress: 2),
                  DailyItemQuestReward(progress: 3)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

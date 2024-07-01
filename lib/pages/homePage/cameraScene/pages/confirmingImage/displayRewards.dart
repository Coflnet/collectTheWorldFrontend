import 'package:collect_the_world/globals/globalScripts/cachingScripts/multiplierCaching.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/baseReward.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyItemQuestReward.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyReward.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/header/rewardTopWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/multipliers.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/rewardsHeader.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/timesCollectedWidget.dart';
import 'package:flutter/material.dart';

class DisplayRewards extends StatefulWidget {
  final int baseReward;
  final double multi;
  final int dailyQuestProgress;
  final int timesCollected;
  final int dailyReward;

  const DisplayRewards(
      {super.key,
      required this.baseReward,
      required this.multi,
      required this.dailyQuestProgress,
      required this.timesCollected,
      required this.dailyReward});

  @override
  _DisplayRewardsState createState() => _DisplayRewardsState();
}

class _DisplayRewardsState extends State<DisplayRewards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.62,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: baseWidget(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseReward(baseReward: widget.baseReward),
                  Multipliers(multi: widget.multi),
                  DailyReward(progress: widget.dailyReward),
                  TimesCollectedWidget(timesCollected: widget.timesCollected),
                  DailyItemQuestReward(progress: widget.dailyQuestProgress)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

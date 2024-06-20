import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
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
      child: baseWidget(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[RewardsHeader(dailyStreak: 1, totalScore: 250)],
        ),
      )),
    );
  }
}

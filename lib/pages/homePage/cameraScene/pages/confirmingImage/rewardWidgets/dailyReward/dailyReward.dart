import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyReward/dailyCompleted.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyReward/dailyRewardDisplay.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyReward/dailyRewardXp.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/rewardWidgetBase.dart';
import 'package:flutter/material.dart';

class DailyReward extends StatelessWidget {
  final int progress;

  const DailyReward({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      height: 90,
      child: RewardWidgetBase(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: <Widget>[
              const Text("  🪟 ", style: TextStyle(fontSize: 38)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Daily quest",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w600),
                        ),
                        DailyRewardXp(progress: progress)
                      ],
                    ),
                    Container(
                        child: (progress > 7)
                            ? const DailyCompleted()
                            : DailyRewardDisplay(progress: progress))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

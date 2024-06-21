import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/rewardWidgetBase.dart';
import 'package:flutter/material.dart';

class BaseReward extends StatelessWidget {
  final int baseReward;
  const BaseReward({super.key, required this.baseReward});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: RewardWidgetBase(
        child: Container(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(" ⭐ ", style: TextStyle(fontSize: 38)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$baseReward",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text("Base reward",
                      style: TextStyle(color: Colors.white38, fontSize: 14))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

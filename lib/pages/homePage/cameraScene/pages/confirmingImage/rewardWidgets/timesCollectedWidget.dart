import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/rewardWidgetBase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimesCollectedWidget extends StatelessWidget {
  final int timesCollected;
  const TimesCollectedWidget({super.key, required this.timesCollected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: RewardWidgetBase(
        child: Container(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(" 🔎 ", style: TextStyle(fontSize: 38)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$timesCollected",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text("Times collected",
                      style: TextStyle(color: Colors.white38, fontSize: 15))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/rewardWidgetBase.dart';
import 'package:flutter/material.dart';

class Multipliers extends StatelessWidget {
  final double multi;
  const Multipliers({super.key, required this.multi});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: RewardWidgetBase(
        child: Container(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: <Widget>[
              const Text(" 💰 ", style: TextStyle(fontSize: 38)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${multi}X",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text("Multipliers",
                      style: TextStyle(color: Colors.white38, fontSize: 14)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

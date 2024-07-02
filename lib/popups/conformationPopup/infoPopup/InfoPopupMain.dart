import 'dart:ui';

import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/reward/rewardVariationMain.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class InfoPopupMain extends StatefulWidget {
  final bool visible;
  final int variation;

  const InfoPopupMain(
      {super.key, required this.variation, required this.visible});

  @override
  _InfoPopupMainState createState() => _InfoPopupMainState();
}

class _InfoPopupMainState extends State<InfoPopupMain> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (visible) || (widget.visible),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black38,
          child: Center(
              child: RewardVariationMain(
            reward: "⭐ 2000XP",
            disapear: disapear,
          )),
        ),
      ),
    );
  }

  void disapear() {
    print("ello");
  }
}

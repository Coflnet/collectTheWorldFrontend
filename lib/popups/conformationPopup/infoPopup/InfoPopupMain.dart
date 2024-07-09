import 'dart:ui';

import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/legalVariationMain.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/penalty/penaltyVariationHeader.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/penalty/penaltyVariationMain.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/reward/rewardVariationMain.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class InfoPopupMain extends StatefulWidget {
  final bool visible;
  final int variation;
  final VoidCallback flip;

  const InfoPopupMain(
      {super.key,
      required this.variation,
      required this.visible,
      required this.flip});

  @override
  _InfoPopupMainState createState() => _InfoPopupMainState();
}

class _InfoPopupMainState extends State<InfoPopupMain> {
  bool visible = true;
  // 1 reward. 2 penilty. 3 legal

  @override
  void initState() {
    super.initState();
    print(widget.variation);
  }
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (visible) && (widget.visible),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black38,
            child: Center(
                child: (widget.variation == 1)
                    ? RewardVariationMain(
                        reward: "⭐ 2000XP",
                        disapear: disapear,
                      )
                    : (widget.variation == 2)
                        ? PenaltyVariationMain(
                            disapear: disapear,
                            penalty: "",
                          )
                        : (widget.variation == 3)
                            ? LegalVariationMain(
                                penalty: "d", disapear: disapear)
                            : Container(width: 50, height: 50, color: Colors.white,)),
          )),
    );
  }

  void disapear() {
    widget.flip();
    setState(() {
      visible = false;
    });
  }
}

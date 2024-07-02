import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/penalty/penaltyVariationHeader.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/reward/rewardVariationButton.dart';
import 'package:flutter/material.dart';

class InfoVariationMain extends StatelessWidget {
  final VoidCallback disapear;
  const InfoVariationMain({super.key, required this.disapear});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: 300,
      child: baseWidget(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const PenaltyVariationHeader(content: "📢Announcement📢",),
              const SizedBox(height: 8),
              const Text(
                textAlign: TextAlign.center,
                "For uploading a incorrect image, you have deducted",
                style: TextStyle(
                    fontFamily: "Rubik-Light",
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
              Expanded(child: RewardVariationButton(disapear: disapear))
            ],
          ),
        ),
      ),
    );
  }
}

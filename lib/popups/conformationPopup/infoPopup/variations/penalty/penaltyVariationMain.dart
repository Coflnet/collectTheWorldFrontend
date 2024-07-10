import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/penalty/penaltyVariationHeader.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/reward/rewardVariationButton.dart';
import 'package:flutter/material.dart';

class PenaltyVariationMain extends StatefulWidget {
  final String penalty;
  final String body;
  final VoidCallback disapear;
  const PenaltyVariationMain(
      {super.key, required this.penalty, required this.disapear, required this.body});

  @override
  _PenaltyVariationMainState createState() => _PenaltyVariationMainState();
}

class _PenaltyVariationMainState extends State<PenaltyVariationMain> {
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
              const PenaltyVariationHeader(),
              const SizedBox(height: 8),
              Text(
                textAlign: TextAlign.center,
                widget.body,
                style: const TextStyle(
                    fontFamily: "Rubik-Light",
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              Text(
                widget.penalty,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: RewardVariationButton(disapear: widget.disapear))
            ],
          ),
        ),
      ),
    );
  }
}

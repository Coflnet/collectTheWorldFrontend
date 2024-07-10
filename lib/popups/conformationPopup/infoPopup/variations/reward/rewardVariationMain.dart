import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/reward/rewardVariationButton.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/reward/rewardVariationConfetti.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/reward/rewardVariationHeader.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class RewardVariationMain extends StatefulWidget {
  final String reward;
  final String body;
  final VoidCallback disapear;
  const RewardVariationMain(
      {super.key, required this.reward, required this.disapear, required this.body});

  @override
  _RewardVariationMainState createState() => _RewardVariationMainState();
}

class _RewardVariationMainState extends State<RewardVariationMain> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    confettiController =
        ConfettiController(duration: const Duration(milliseconds: 50));
    confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          height: 300,
          child: baseWidget(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const RewardVariationHeader(),
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
                    widget.reward,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(
                      child: RewardVariationButton(disapear: widget.disapear))
                ],
              ),
            ),
          ),
        ),
        RewardVariationConfetti(confettiController: confettiController)
      ],
    );
  }
}

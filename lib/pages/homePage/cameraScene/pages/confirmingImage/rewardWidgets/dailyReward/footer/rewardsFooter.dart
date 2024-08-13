import 'package:collect_the_world/globals/globalWidgets/attentionWidget/attentionWidget.dart';
import 'package:collect_the_world/main.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyReward/footer/rewardFooterHomeButton.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/dailyReward/footer/rewardFooterNextItem.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/rewardWidgetBase.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/returnPage/returnPageMain.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class RewardsFooter extends StatelessWidget {
  final String itemName;
  const RewardsFooter({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(21, 31, 51, 1),
            border: Border(
                top:
                    BorderSide(color: Colors.grey.withOpacity(0.6), width: 2))),
        padding: const EdgeInsets.fromLTRB(24, 6, 24, 0),
        height: 76,
        child: Row(
          children: [
            Expanded(
              child: AttentionWidget(
                child: TextButton(
                    onPressed: () => {
                          Haptics.vibrate(HapticsType.light),
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const ReturnPageMain(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return child;
                                },
                                transitionDuration:
                                    const Duration(milliseconds: 0),
                              ))
                        },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.grey[100],
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

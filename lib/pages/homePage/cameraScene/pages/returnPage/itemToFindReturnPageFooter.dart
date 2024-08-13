import 'package:collect_the_world/globals/globalWidgets/attentionWidget/attentionWidget.dart';
import 'package:collect_the_world/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class ItemToFindReturnPageFooter extends StatelessWidget {
  const ItemToFindReturnPageFooter({super.key});

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
                                        const HomePage(),
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

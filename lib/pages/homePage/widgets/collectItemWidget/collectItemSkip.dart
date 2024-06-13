import 'dart:ui';

import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/popups/conformationPopup/conformationPopup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback parentCallBack;
  final VoidCallback parentCallBackStarted;
  final String itemName;
  const SkipButton(
      {super.key,
      required this.parentCallBack,
      required this.parentCallBackStarted,
      required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 4, 8),
      width: 110,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(77, 65, 138, 1),
                Color.fromRGBO(77, 65, 138, 1)
              ]),
          borderRadius: BorderRadius.circular(16)),
      child: TextButton(
        onPressed: () => {buttonPressedSkip(context)},
        child: const Text(
          "Skip item",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: "Fredoka-SemiExpanded"),
        ),
      ),
    );
  }

  void skipConfirmed() {
    parentCallBack();
  }

  void buttonPressedSkip(context) async {
    print("hello");
    remainingSkips = await ItemToFindHandler().getRemainingSkips();
    Provider.of<PopupNotifier>(context, listen: false)
        .appear(skipConfirmed, parentCallBackStarted, itemName, remainingSkips);
  }
}

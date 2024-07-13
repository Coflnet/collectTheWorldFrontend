import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrentSkips extends StatefulWidget {
  final int remainingSkips;
  const CurrentSkips({super.key, required this.remainingSkips});

  @override
  CurrentPositionState createState() => CurrentPositionState();
}

class CurrentPositionState extends State<CurrentSkips> {
  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      pressType: PressType.singleClick,
      barrierColor: Colors.transparent,
      menuBuilder: () => ClipRRect(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(151, 129, 234, 1),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            "Collect any image\nto get up to 2 skips",
            style: TextStyle(color: Colors.grey[200], fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      child: Row(children: [
        const Text(
          "⏭️",
          style: TextStyle(fontSize: 23),
        ),
        Container(
          margin: const EdgeInsets.only(left: 8),
          child: Text(
            "$remainingSkips",
            textScaler: const TextScaler.linear(1.85),
            style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w600),
          ),
        ),
      ]),
    );
  }
}

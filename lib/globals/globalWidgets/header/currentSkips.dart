import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
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
    return Row(children: [
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
    ]);
  }
}

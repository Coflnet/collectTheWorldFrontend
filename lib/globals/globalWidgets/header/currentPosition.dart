import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrentPosition extends StatefulWidget {
  @override
  CurrentPositionState createState() => CurrentPositionState();
}

class CurrentPositionState extends State<CurrentPosition> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(
        "assets/Leaderboard.png",
        scale: 3,
      ),
      Container(
        margin: const EdgeInsets.only(left: 8),
        child: Text(
          "100th",
          textScaler: const TextScaler.linear(1.55),
          style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600),
        ),
      ),
    ]);
  }
}

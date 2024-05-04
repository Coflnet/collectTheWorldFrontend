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
      const Icon(Icons.leaderboard_outlined, size: 30, color: Colors.white,),
      Container(
        margin: const EdgeInsets.only(left: 10),
        child: const Text(
          "100th",
          textScaler: TextScaler.linear(1.55),
          style: TextStyle(color: Colors.white),
        ),
      ),
    ]);
  }
}

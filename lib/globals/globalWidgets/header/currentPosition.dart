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
      const Icon(Icons.leaderboard_outlined, size: 30, color: Color.fromARGB(255, 48, 95, 177),),
      Container(
        margin: const EdgeInsets.only(left: 10),
        child: Text(
          "100th",
          textScaler: const TextScaler.linear(1.55),
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontFamily: "Poppins-Medium"),
        ),
      ),
    ]);
  }
}

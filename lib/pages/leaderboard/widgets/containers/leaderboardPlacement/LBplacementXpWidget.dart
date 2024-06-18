import 'package:flutter/material.dart';

class LBplacementXpWidget extends StatelessWidget {
  final int count;
  const LBplacementXpWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: count == 0 ? false : true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("+$count",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 20,
                  fontFamily: "Robik-RLight",
                  fontWeight: FontWeight.w600)),
          const SizedBox(width: 2),
          Text("XP",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 20,
                  fontFamily: "Robik-RLight",
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NoRemainingSkips extends StatelessWidget {
  const NoRemainingSkips({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 4, 8),
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: 110,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  HexColor("#6430FF"),
                  HexColor("#6430FF"),
                ]),
            borderRadius: BorderRadius.circular(16)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "No Skips",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Fredoka-SemiExpanded"),
            ),
          ],
        ));
  }
}

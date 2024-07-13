import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DailyRewardDisplay extends StatelessWidget {
  final int progress;
  const DailyRewardDisplay({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                backgroundColor: Colors.pink[50],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                value: progress / 7,
                minHeight: 22,
              ),
            ),
            Image.asset(
              "assets/treasureChestGold.png",
              scale: 3.3,
            ),
            const SizedBox(width: 16)
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 1.5),
              child: Text(
                "$progress/7",
                style: const TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(1.5, 1.5),
                          blurRadius: 5)
                    ],
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
            const SizedBox(width: 30)
          ],
        )
      ],
    );
  }
}

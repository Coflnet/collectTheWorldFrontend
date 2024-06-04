import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBplacementOne.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBplacementThree.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBplacementTwo.dart';
import 'package:flutter/material.dart';

class LBPLmain extends StatelessWidget {
  final List topUsers;
  const LBPLmain({super.key, required this.topUsers});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 16),
        LBplacementTwo(userInfo: ["na"]),
        LBplacementOne(userInfo: ["NA", 1]),
        LBplacementThree(userInfo: ["NA"]),
        SizedBox(width: 16),
      ],
    );
  }
}

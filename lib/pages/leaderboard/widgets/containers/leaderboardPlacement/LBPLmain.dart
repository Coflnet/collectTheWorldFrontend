import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBplacementOne.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBplacementThree.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBplacementTwo.dart';
import 'package:flutter/material.dart';

class LBPLmain extends StatelessWidget {
  final List topUsers;
  final int whichLeaderBoard;
  const LBPLmain(
      {super.key, required this.topUsers, required this.whichLeaderBoard});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 16),
        LBplacementTwo(
          userInfo:
              topUsers.isNotEmpty ? topUsers[1] : ["loading", "alsoloading"],
          whichLeaderBoard: whichLeaderBoard,
        ),
        LBplacementOne(
            userInfo:
                topUsers.isNotEmpty ? topUsers[0] : ["loading", "alsoloading"],
            whichLeaderBoard: whichLeaderBoard),
        LBplacementThree(
            userInfo:
                topUsers.isNotEmpty ? topUsers[2] : ["loading", "alsoloading"],
            whichLeaderBoard: whichLeaderBoard),
        const SizedBox(width: 16),
      ],
    );
  }
}

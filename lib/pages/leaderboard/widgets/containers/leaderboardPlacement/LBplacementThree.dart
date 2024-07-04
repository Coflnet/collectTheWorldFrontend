import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_the_world/globals/globalScripts/systems/serverSideData/serverSideData.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBprofilePicture.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBplacementXpWidget.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class LBplacementThree extends StatelessWidget {
  final List userInfo;
  final int whichLeaderBoard;

  const LBplacementThree(
      {super.key, required this.userInfo, required this.whichLeaderBoard});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
            decoration: BoxDecoration(
                color: Colors.brown[600],
                borderRadius: BorderRadius.circular(8)),
            child: PlacementContent(
              userInfo: userInfo,
              whichLeaderBoard: whichLeaderBoard,
            ),
          )
        ],
      ),
    );
  }
}

class PlacementContent extends StatelessWidget {
  final List userInfo;
  final int whichLeaderBoard;

  const PlacementContent(
      {super.key, required this.userInfo, required this.whichLeaderBoard});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RandomAvatar("loading", width: 48, height: 48),
        const SizedBox(
          height: 8,
        ),
        AutoSizeText(
          overflow: TextOverflow.ellipsis,
          userInfo[0],
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        Text(
          "3",
          style: TextStyle(
            color: Colors.yellow[50],
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 10),
        LBplacementXpWidget(
          count: whichLeaderBoard == 0
              ? ServerSideData().getLeaderboardTopThree[0][2]
              : whichLeaderBoard == 1
                  ? ServerSideData().getLeaderboardTopThree[1][2]
                  : 0,
        )
      ],
    );
  }
}

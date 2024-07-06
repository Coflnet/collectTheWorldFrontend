import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_the_world/globals/globalScripts/systems/serverSideData/serverSideData.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBprofilePicture.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBplacementXpWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_avatar/random_avatar.dart';

class LBplacementOne extends StatelessWidget {
  final List userInfo;
  final int whichLeaderBoard;

  const LBplacementOne(
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
            padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
            decoration: BoxDecoration(
                color: Colors.yellow[700],
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
        RandomAvatar(userInfo[3] ?? "loading", width: 48, height: 48),
        const SizedBox(
          height: 4,
        ),
        AutoSizeText(
          overflow: TextOverflow.ellipsis,
          userInfo[0],
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
        ),
        Text(
          "1",
          style: TextStyle(
            color: Colors.yellow[50],
            fontSize: 36,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        LBplacementXpWidget(
          count: whichLeaderBoard == 0
              ? ServerSideData().getLeaderboardTopThree[0][0]
              : whichLeaderBoard == 1
                  ? ServerSideData().getLeaderboardTopThree[1][0]
                  : 0,
        )
      ],
    );
  }
}

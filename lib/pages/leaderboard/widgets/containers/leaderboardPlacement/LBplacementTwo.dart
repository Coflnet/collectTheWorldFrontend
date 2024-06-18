import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBprofilePicture.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBplacementXpWidget.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class LBplacementTwo extends StatelessWidget {
  final List userInfo;
  final int whichLeaderBoard;
  const LBplacementTwo(
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
                color: Colors.grey[400],
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
          height: 4,
        ),
        AutoSizeText(
          overflow: TextOverflow.ellipsis,
          userInfo[0],
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        Text(
          "2",
          style: TextStyle(
            color: Colors.yellow[50],
            fontSize: 33,
          ),
        ),
        const SizedBox(height: 9),
        LBplacementXpWidget(
          count: whichLeaderBoard == 0
              ? 2000
              : whichLeaderBoard == 1
                  ? 3000
                  : 0,
        )
      ],
    );
  }
}

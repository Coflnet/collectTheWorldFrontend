import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_the_world/globals/globalScripts/systems/serverSideData/serverSideData.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBprofilePicture.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderboardInfo/leaderboardProfileWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBplacementXpWidget.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
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
          CustomPopupMenu(
              arrowSize: 40,
              arrowColor: const Color.fromRGBO(73, 64, 119, 1),
              verticalMargin: -40,
              menuBuilder: () => LeaderboardProfileWidget(
                  username: userInfo[0] ?? "None", 
                  profileImage: userInfo[3] ?? "loading",
                  userid: userInfo[2] ?? "1"),
              pressType: PressType.singleClick,
              child: Container(
                margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
                decoration: BoxDecoration(
                    color: Colors.brown[600],
                    borderRadius: BorderRadius.circular(8)),
                child: PlacementContent(
                  userInfo: userInfo,
                  whichLeaderBoard: whichLeaderBoard,
                ),
              ))
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

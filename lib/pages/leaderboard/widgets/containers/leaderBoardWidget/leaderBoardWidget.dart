import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBPositionWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBprofilePicture.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBuserNameWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBxpWidget.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/globals/extentions/extentions.dart';

class LeaderBoardWidget extends StatelessWidget {
  final String name;
  final int xp;
  final int index;
  const LeaderBoardWidget(
      {super.key, required this.name, this.xp = 25, required this.index});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0)),
        onPressed: () {},
        child: Column(
          children: [
            Row(
              children: [
                LBPositionWidget(index: index),
                const TmpProfile(),
                LBuserNameWidget(name: name),
                LBxpWidget(xp: xp)
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(98, 99, 112, 0.356),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              width: 380,
              height: 2,
            )
          ],
        ));
  }
}

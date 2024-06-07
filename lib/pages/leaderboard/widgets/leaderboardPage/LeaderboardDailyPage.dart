import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardHandler.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderBoardWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderboardDivider.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBPLmain.dart';
import 'package:flutter/material.dart';

class LeaderboardDailyPage extends StatefulWidget {
  const LeaderboardDailyPage({super.key});

  @override
  LeaderboardDailyPageState createState() => LeaderboardDailyPageState();
}

class LeaderboardDailyPageState extends State<LeaderboardDailyPage> {
  @override
  void initState() {
    super.initState();
    loadLeaderBoard();
  }

  List leaderboardlist = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [LBRewardInfoWidget()],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 4.5,
                child: const LBPLmain(topUsers: [])),
            const LeaderboardDivider()
          ],
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(bottom: 70),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: leaderboardlist.length,
              itemBuilder: (context, index) {
                return LeaderBoardWidget(
                    name: leaderboardlist[index][0],
                    xp: leaderboardlist[index][1],
                    index: index);
              },
            ),
          ),
        ))
      ],
    );
  }

  void loadLeaderBoard() async {
    final result = await LeaderboardHandler().getLeaderboard(1);
    setState(() {
      leaderboardlist = result;
    });
  }
}

class LBRewardInfoWidget extends StatelessWidget {
  const LBRewardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 104, 0, 8),
      child: baseWidget(
        child: TextButton(
            style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4)),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Rewards",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(width: 5),
                Icon(Icons.info_outline, size: 35, color: Colors.pink[50]),
              ],
            )),
      ),
    );
  }
}

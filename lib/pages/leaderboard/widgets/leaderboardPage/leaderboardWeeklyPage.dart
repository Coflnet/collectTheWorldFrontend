import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardHandler.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderBoardWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderboardDivider.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBPLmain.dart';
import 'package:flutter/material.dart';

class LeaderboardWeeklyPage extends StatefulWidget {
  const LeaderboardWeeklyPage({Key? key}) : super(key: key);

  @override
  _LeaderboardWeeklyPageState createState() => _LeaderboardWeeklyPageState();
}

class _LeaderboardWeeklyPageState extends State<LeaderboardWeeklyPage> {
  List leaderboardlist = [];

  @override
  void initState() {
    super.initState();
    loadLeaderBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            const SizedBox(
              height: 105,
            ),
            const LBRewardDaily(),
            SizedBox(
                height: MediaQuery.of(context).size.height / 4.5,
                child: const LBPLmain(topUsers: [])),
            const LeaderboardDivider(),
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
    final result = await LeaderboardHandler().getLeaderboard(2);
    setState(() {
      leaderboardlist = result;
    });
  }
}

class LBRewardDaily extends StatelessWidget {
  const LBRewardDaily({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text("Top Ten",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20)),
        Text("+1000XP",
            style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 25,
                fontFamily: "Rukik-RLight",
                fontWeight: FontWeight.w700))
      ],
    );
  }
}

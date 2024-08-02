import 'package:collect_the_world/globals/globalScripts/systems/serverSideData/serverSideData.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardHandler.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderBoardWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderboardDivider.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBPLmain.dart';
import 'package:flutter/material.dart';

class LeaderboardWeeklyPageContent extends StatefulWidget {
  const LeaderboardWeeklyPageContent({Key? key}) : super(key: key);

  @override
  _LeaderboardWeeklyPageState createState() => _LeaderboardWeeklyPageState();
}

class _LeaderboardWeeklyPageState extends State<LeaderboardWeeklyPageContent> {
  List leaderboardlist = [];
  final controller = ScrollController();
  int currentOffset = 0;

  @override
  void initState() {
    super.initState();
    LeaderboardHandler().refreshLeaderboard(3, first: true);
    loadLeaderBoard();
    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (isTop) {
        } else {
          loadMore();
        }
      }
    });
  }

  void loadMore() async {
    if (leaderboardlist.length < 10){
      return;
    }
    List addList =
        await LeaderboardHandler().getLeaderboardOffset(2, currentOffset + 10);
    setState(() {
      leaderboardlist.addAll(addList);
      currentOffset += 10;
    });
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
            const LBRewardWeekly(),
            SizedBox(
                height: MediaQuery.of(context).size.height / 4.2,
                child: LBPLmain(
                  topUsers: leaderboardlist.take(3).toList(),
                  whichLeaderBoard: 1,
                )),
            const LeaderboardDivider(),
          ],
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(bottom: 70),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: RefreshIndicator(
              onRefresh: pullRefresh,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: leaderboardlist.length,
                itemBuilder: (context, index) {
                  return LeaderBoardWidget(
                    name: leaderboardlist[index][0],
                    xp: leaderboardlist[index][1],
                    index: index,
                    profileImage: leaderboardlist[index][3] ?? "",
                    userId: leaderboardlist[index][2] ?? "",
                  );
                },
              ),
            ),
          ),
        ))
      ],
    );
  }

  Future<void> pullRefresh() async {
    List resultList = await LeaderboardHandler().refreshLeaderboard(2);
    setState(() {
      leaderboardlist = resultList;
    });
    return;
  }

  void loadLeaderBoard() async {
    final result = await LeaderboardHandler().getLeaderboard(2);
    setState(() {
      leaderboardlist = result;
    });
  }
}

class LBRewardWeekly extends StatelessWidget {
  const LBRewardWeekly({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text("Top twenty",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20)),
        Text("+${ServerSideData().getLeaderboardBaseRewards[1]}XP",
            style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 25,
                fontFamily: "Rukik-RLight",
                fontWeight: FontWeight.w700))
      ],
    );
  }
}

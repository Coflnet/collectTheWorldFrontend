import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardHandler.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderBoardWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderboardDivider.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBPLmain.dart';
import 'package:flutter/material.dart';

class LeaderboardAllTimeContent extends StatefulWidget {
  const LeaderboardAllTimeContent({super.key});

  @override
  LleaderbStateoardAllTimePage createState() => LleaderbStateoardAllTimePage();
}

class LleaderbStateoardAllTimePage extends State<LeaderboardAllTimeContent> {
  final controller = ScrollController();
  int currentOffset = 0;

  List leaderboardlist = [];

  @override
  void initState() {
    super.initState();
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
        await LeaderboardHandler().getLeaderboardOffset(1, currentOffset + 10);
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
            const Text(
              "All time",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 4.5,
                child: LBPLmain(
                  topUsers: leaderboardlist.take(3).toList(),
                  whichLeaderBoard: 2,
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
    List resultList = await LeaderboardHandler().refreshLeaderboard(3);
    setState(() {
      leaderboardlist = resultList;
    });
    return;
  }

  void loadLeaderBoard() async {
    final result = await LeaderboardHandler().getLeaderboard(3);
    print(result);
    setState(() {
      leaderboardlist = result;
    });
  }
}

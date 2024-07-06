import 'dart:ffi';

import 'package:collect_the_world/globals/globalScripts/systems/serverSideData/serverSideData.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/endOfScrollLoading.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardHandler.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderBoardWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderboardDivider.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPlacement/LBPLmain.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/dailyPage/LeaderboardDailyPage.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/dailyPage/beTheFirstDailyWidget.dart';
import 'package:flutter/material.dart';

class LeaderboardDailyContent extends StatefulWidget {
  const LeaderboardDailyContent({super.key});

  @override
  _LeaderboardDailyContentState createState() =>
      _LeaderboardDailyContentState();
}

class _LeaderboardDailyContentState extends State<LeaderboardDailyContent> {
  final controller = ScrollController();
  int currentOffset = 0;

  @override
  void initState() {
    super.initState();
    loadLeaderBoard();
    LeaderboardHandler().getLeaderboard(2);
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
    if (leaderboardlist.length < 10) {
      return;
    }
    List addList =
        await LeaderboardHandler().getLeaderboardOffset(1, currentOffset + 10);
    setState(() {
      leaderboardlist.addAll(addList);
      currentOffset += 10;
    });
  }

  bool isEmpty = true;
  List leaderboardlist = [[]];

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
                child: LBPLmain(
                  topUsers: (leaderboardlist.isNotEmpty && !isEmpty)
                      ? leaderboardlist.take(3).toList()
                      : [],
                  whichLeaderBoard: 0,
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
                  return isEmpty
                      ? BeTheFirstDailyWidget()
                      : (leaderboardlist.length == index && index > 10)
                          ? const EndOfScrollLoading()
                          : LeaderBoardWidget(
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
    List resultList = await LeaderboardHandler().refreshLeaderboard(1);
    setState(() {
      leaderboardlist = (resultList.isEmpty) ? [[]] : resultList;
      isEmpty = resultList.isEmpty;
    });
    return;
  }

  void loadLeaderBoard() async {
    final result = await LeaderboardHandler().getLeaderboard(1);
    setState(() {
      leaderboardlist = (result.isEmpty) ? [[]] : result;
      isEmpty = result.isEmpty;
    });
  }
}

class LBRewardDaily extends StatelessWidget {
  const LBRewardDaily({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text("Top ten",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20)),
        Text("+${ServerSideData().getLeaderboardBaseRewards[0]}XP",
            style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 25,
                fontFamily: "Rukik-RLight",
                fontWeight: FontWeight.w700))
      ],
    );
  }
}

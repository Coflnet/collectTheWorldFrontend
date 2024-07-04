import 'dart:ffi';

import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderboardDivider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class PageChangeNotifer extends ChangeNotifier {
  late LeaderboardHeaderState lbState;

  void setPageState(LeaderboardHeaderState state) {
    lbState = state;
  }

  void changePage(id) {
    lbState.changePageSel(id);
  }
}

class LeaderboardHeader extends StatefulWidget {
  const LeaderboardHeader({super.key});

  @override
  LeaderboardHeaderState createState() => LeaderboardHeaderState();
}

class LeaderboardHeaderState extends State<LeaderboardHeader> {
  int currentSelection = 1;

  var nameTextStyle = ({int sel = 1, int cur = 0}) {
    return TextStyle(
        color: cur == sel ? Colors.white : Colors.white70, fontSize: 20);
  };

  @override
  Widget build(BuildContext context) {
    Provider.of<PageChangeNotifer>(context, listen: false).setPageState(this);
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(21, 31, 51, 1)),
      height: 90,
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Daily",
                          style: nameTextStyle(sel: 1, cur: currentSelection)),
                      Text("Weekly",
                          style: nameTextStyle(sel: 2, cur: currentSelection)),
                      Text("All Time",
                          style: nameTextStyle(sel: 3, cur: currentSelection))
                    ],
                  ),
                ),
              ],
            ),
            const LeaderboardDivider(),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              left: MediaQuery.of(context).size.width *
                  getIndicatorPosition(currentSelection),
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width /
                    3, // line width relative to text width
                height: 3,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changePageSel(int id) {
    setState(() {
      currentSelection = id;
    });
  }

  double getIndicatorPosition(int selection) {
    switch (selection) {
      case 1:
        return -0.03;
      case 2:
        return 0.31;
      case 3:
        return 0.665;
      default:
        return 0;
    }
  }
}

class LeaderboardHeaderDivider extends StatelessWidget {
  const LeaderboardHeaderDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 1.5,
        color: Colors.grey,
      ),
    );
  }
}

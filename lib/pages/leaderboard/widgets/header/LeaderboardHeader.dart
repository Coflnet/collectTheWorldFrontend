import 'package:flutter/material.dart';

class LeaderboardHeader extends StatefulWidget {
  const LeaderboardHeader({super.key});

  @override
  LeaderboardHeaderState createState() => LeaderboardHeaderState();
}

class LeaderboardHeaderState extends State<LeaderboardHeader> {
  int currentSelection = 3;

  var nameTextStyle = ({int sel = 1, int cur = 0}) {
    return TextStyle(
        color: cur == sel ? Colors.white : Colors.white70, fontSize: 20);
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueGrey[800]),
      height: 90,
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
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

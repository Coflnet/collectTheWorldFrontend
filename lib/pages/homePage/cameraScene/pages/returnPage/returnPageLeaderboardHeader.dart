import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReturnPageLeaderboardHeader extends StatelessWidget {
  final int selection;
  final Function(int) callBack;
  ReturnPageLeaderboardHeader(
      {super.key, required this.selection, required this.callBack});

  var nameTextStyle = ({int sel = 1, int cur = 0}) {
    return TextStyle(
        color: cur == sel ? Colors.white : Colors.white70, fontSize: 20);
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
            onPressed: () => callBack(0),
            child: Text("Daily", style: nameTextStyle(sel: 1, cur: selection)),
          ),
          TextButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
            onPressed: () => callBack(1),
            child: Text("Weekly", style: nameTextStyle(sel: 2, cur: selection)),
          ),
          TextButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
            onPressed: () => callBack(2),
            child:
                Text("All Time", style: nameTextStyle(sel: 3, cur: selection)),
          )
        ],
      ),
    );
  }
}

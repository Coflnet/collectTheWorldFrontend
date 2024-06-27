import 'package:collect_the_world/globals/globalWidgets/header/currentSkips.dart';
import 'package:collect_the_world/globals/globalWidgets/header/dailyStreak.dart';
import 'package:collect_the_world/globals/globalWidgets/header/xpwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../globalScripts/systems/profilePicture.dart';

class CustomHeader extends StatefulWidget {
  final int dailStreakNum;
  final int xp;
  const CustomHeader({
    super.key,
    required this.dailStreakNum,
    required this.xp,
  });

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<CustomHeader> {
  int xp = ProfileRetrevial().getTotalXp();
  @override
  void initState() {
    super.initState();
    loadfileData();
  }

  void loadfileData() async {
    print("hello world");

    if (widget.xp != 0) {
      setState(() {
        xp = widget.xp;
      });
      return;
    }
    await LoadingProfileInfo().loadProfileFile();
    print("finnished ${ProfileRetrevial().getTotalXp()}");

    setState(() {
      xp = ProfileRetrevial().getTotalXp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(21, 31, 51, 1),
        border: Border(
            bottom: BorderSide(
                color: Color.fromARGB(255, 141, 141, 141), width: 2)),
      ),
      height: 105,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 52, 20, 0),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CurrentSkips(),
                DailyStreak(
                  dailStreakNum: widget.dailStreakNum,
                ),
                XpWidget(
                  xp: (widget.xp == 0) ? xp : widget.xp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}

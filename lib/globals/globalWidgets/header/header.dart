import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/globals/globalWidgets/header/currentSkips.dart';
import 'package:collect_the_world/globals/globalWidgets/header/dailyStreak.dart';
import 'package:collect_the_world/globals/globalWidgets/header/xpwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class SkipChangeNotifier extends ChangeNotifier {
  late _HeaderState _popeupState;

  void setPopupState(_HeaderState state) {
    _popeupState = state;
  }

  void appear() {
    _popeupState.update();
  }
}

class _HeaderState extends State<CustomHeader> {
  int xp = ProfileRetrevial().getTotalXp();
  int remainingSkips = (ItemToFindHandler().returnRamaingSkips() == 10)
      ? 2
      : ItemToFindHandler().returnRamaingSkips();
  @override
  void initState() {
    super.initState();
    loadfileData();
  }

  void loadfileData() async {
    if (widget.xp != 0) {
      setState(() {
        xp = widget.xp;
      });
      return;
    }
    await LoadingProfileInfo().loadProfileFile();

    setState(() {
      xp = ProfileRetrevial().getTotalXp();
    });
  }

  void update() {
    setState(() {
      remainingSkips = ItemToFindHandler().returnRamaingSkips();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SkipChangeNotifier>(context, listen: false).setPopupState(this);

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
                CurrentSkips(remainingSkips: remainingSkips),
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

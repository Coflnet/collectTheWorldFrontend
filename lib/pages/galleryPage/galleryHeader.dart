import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/globals/globalWidgets/header/currentSkips.dart';
import 'package:collect_the_world/globals/globalWidgets/header/dailyStreak.dart';
import 'package:collect_the_world/globals/globalWidgets/header/xpwidget.dart';
import 'package:flutter/material.dart';

class GalleryHeader extends StatelessWidget {
  GalleryHeader({super.key});
  int remainingSkips = (ItemToFindHandler().returnRamaingSkips() == 10)
      ? 2
      : ItemToFindHandler().returnRamaingSkips();
  int dailyStreak = 0;

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
                CurrentSkips(remainingSkips: remainingSkips),
                DailyStreak(
                  dailyStreak: ProfileRetrevial().getStreak(),
                ),
                XpWidget(
                  xp: ProfileRetrevial().getTotalXp(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

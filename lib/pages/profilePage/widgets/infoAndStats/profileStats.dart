import 'dart:ffi';

import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/infoAndStats/profileStatsWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/profileStats/profileStatsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 18, 24, 0),
      child: baseWidget(
          child: Column(
        children: <Widget>[
          const SizedBox(height: 6),
          const Text(
            "🎉 Achievements",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          Container(
            height: 150,
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      ProfileStatsWidgetCustom(
                          icon: "📷", name: "Unique", count: ProfileRetrevial().getUnqie()),
                      ProfileStatsWidgetCustom(
                          icon: "⭐", name: "Total XP", count: ProfileRetrevial().getTotalXp())
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      ProfileStatsWidgetCustom(
                          icon: "🏅", name: "Top ten", count: ProfileRetrevial().getTopThree(), iconSize: 28),
                      ProfileStatsWidgetCustom(
                          icon: "📸", name: "Total", count: ProfileRetrevial().getTotal())
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 6),
        ],
      )),
    );
  }
}

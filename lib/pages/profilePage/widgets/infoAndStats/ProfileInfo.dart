import 'package:collect_the_world/globals/extentions/extentions.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/editProfileMain.dart';
import 'package:collect_the_world/pages/profilePage/widgets/infoAndStats/profileNameAndDate.dart';
import 'package:collect_the_world/pages/profilePage/widgets/infoAndStats/profileStats.dart';
import 'package:collect_the_world/pages/profilePage/widgets/infoAndStats/profileStatsWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/infoAndStats/profileStreakInfo.dart';
import 'package:collect_the_world/pages/profilePage/widgets/profileStats/profileStatsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
            onPressed: () => {changeScene(context)},
            icon: Icon(
              Ionicons.settings_outline,
              color: Colors.grey[400],
              size: 30,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileNameAndDate(),
            Container(
              height: 2,
              color: Colors.grey[700],
              margin: const EdgeInsets.only(top: 10),
            ),
            const ProfileStats(),
          ],
        ),
      ],
    );
  }

  void changeScene(context) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const EditProfileMain(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
          transitionDuration: const Duration(milliseconds: 0),
        ));
  }
}

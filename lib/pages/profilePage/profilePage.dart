import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:collect_the_world/pages/homePage/widgets/collectItemWidget/collectItemWidget.dart';
import 'package:collect_the_world/pages/profilePage/profileWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/linkButtons/discordLinkButton.dart';
import 'package:collect_the_world/pages/profilePage/widgets/linksWidget.dart';
import 'package:collect_the_world/popups/conformationPopup/conformationPopup.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/globals/globalScripts/systems/dailyStreak.dart'
    as globalStreakFile;

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        home: Scaffold(
          floatingActionButton: CameraButtonFooter(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Stack(
            children: [
              const BackgroundGradiant(),
              Column(
                children: [
                  CustomHeader(dailStreakNum: globalStreakFile.streak),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                  ),
                  const ProfileWidget(),
                  const LinksWidget(),
                ],
              ),
              const Footer(),
            ],
          ),
        ));
  }
}

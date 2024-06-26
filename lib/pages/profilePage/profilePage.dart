import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:collect_the_world/pages/homePage/widgets/collectItemWidget/collectItemWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/infoAndStats/ProfileInfo.dart';
import 'package:collect_the_world/pages/profilePage/widgets/infoAndStats/profileStoreWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/linkButtons/discordLinkButton.dart';
import 'package:collect_the_world/pages/profilePage/widgets/linksWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/popups/editProfilePopup.dart';
import 'package:collect_the_world/pages/profilePage/widgets/profileDisplay/profileDisplay.dart';
import 'package:collect_the_world/popups/conformationPopup/conformationPopup.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/globals/globalScripts/systems/dailyStreak.dart'
    as globalStreakFile;
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        home: const Scaffold(
          floatingActionButton: CameraButtonFooter(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Stack(
            children: [
              BackgroundGradiant(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileDisplay(),
                    ProfileInfo(),
                    ProfileStoreWidget(),
                    LinksWidget(),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ));
  }
}

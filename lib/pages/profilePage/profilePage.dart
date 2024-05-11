import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:collect_the_world/pages/homePage/collectPage/header.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/globals/globalScripts/dailyStreak.dart'
    as globalStreakFile;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        home: Scaffold(
          body: Stack(
            children: [
              const BackgroundGradiant(),
              Column(
                children: [
                  CustomHeader(dailStreakNum: globalStreakFile.streak),
                ],
              ),
              const Footer(),
            ],
          ),
        ));
  }
}

import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/globals/globalScripts/systems/dailyStreak.dart'
    as globalStreakFile;


class LeaderboardMain extends StatefulWidget {
  const LeaderboardMain({super.key});

  @override
  LeaderboardMainState createState() => LeaderboardMainState();
}

class LeaderboardMainState extends State<LeaderboardMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        body: Stack(
          children: [
            const BackgroundGradiant(),
            CustomHeader(dailStreakNum: globalStreakFile.streak),
            const Footer(),
          ],
        ),
        floatingActionButton: const CameraButtonFooter(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

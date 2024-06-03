import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/header/LeaderboardHeader.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/LeaderboardDailyPage.dart';
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
      home: const Scaffold(
        body: Stack(
          children: [
            BackgroundGradiant(),
            LeaderboardHeader(),
            LeaderboardDailyPage(),
            Footer(),
          ],
        ),
        floatingActionButton: const CameraButtonFooter(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPageContainer.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/header/LeaderboardHeader.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/LeaderboardDailyPage.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/leaderboardWeeklyPage.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/globals/globalScripts/systems/dailyStreak.dart'
    as globalStreakFile;
import 'package:provider/provider.dart';

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
        body: ChangeNotifierProvider(
          create: (context) => PageChangeNotifer(),
          child: const Stack(
            children: [
              BackgroundGradiant(),
              LeaderboardHeader(),
              LeaderBoardPageContainer(),
              Footer(),
            ],
          ),
        ),
        floatingActionButton: const CameraButtonFooter(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

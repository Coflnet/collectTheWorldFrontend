import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/placementCaching.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderboardPageContainer.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/header/LeaderboardHeader.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/dailyPage/LeaderboardDailyPage.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/weeklyPage/leaderboardWeeklyPage.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LeaderboardMain extends StatefulWidget {
  const LeaderboardMain({super.key});

  @override
  LeaderboardMainState createState() => LeaderboardMainState();
}

class LeaderboardMainState extends State<LeaderboardMain> {
  @override
  void initState() {
    super.initState();
    placementCaching().loadPlacements();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => PageChangeNotifer()),
            ChangeNotifierProvider(create: (_) => PageChangeBackNotifer())
          ],
          child: const Stack(
            children: [
              BackgroundGradiant(),
              LeaderBoardPageContainer(),
              LeaderboardHeader(),

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

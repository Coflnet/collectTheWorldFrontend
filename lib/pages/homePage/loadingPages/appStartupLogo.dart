import 'package:collect_the_world/globals/globalScripts/cachingScripts/challengeCaching.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/listCaching.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/placementCaching.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/gallerySaving.dart';
import 'package:collect_the_world/globals/globalScripts/systems/infoPopupHandler.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/globals/globalScripts/systems/legalChangeUploader.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/globals/globalScripts/systems/serverSideData/serverSideData.dart';
import 'package:collect_the_world/main.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardHandler.dart';
import 'package:flutter/material.dart';

class AppStartupLogo extends StatefulWidget {
  const AppStartupLogo({Key? key}) : super(key: key);

  @override
  _AppStartupLogoState createState() => _AppStartupLogoState();
}

class _AppStartupLogoState extends State<AppStartupLogo> {
  double scale = 1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  void loadData() async {
    LoadingProfileInfo().load();
    await Authclient().initClient();
    gallerySaving().loadDataBase();
    ItemToFindHandler().loadFileData();
    ItemToFindHandler().requestRemainingSkips();
    ServerSideData().loadFileData();
    InfoPopupHandler().requestPopup();
    InfoPopupHandler().loadFileData();
    ListCaching().checkIfItemUpdated();
    ChallengeCaching().getDailyChallenge();
    LeaderboardHandler().refreshLeaderboard(1);
    await LoadingProfileInfo().loadStatsFromCloud();

    LegalChangeUploader().loadFileData();
    placementCaching().loadPlacements();
    LeaderboardHandler().getLeaderboard(1);

    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
          transitionDuration: const Duration(milliseconds: 0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(microseconds: 500),
        child: Container(
          width: 250,
          height: 250,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/images/logoVersionOneLogoTransparent.png"))),
        ),
      ),
    );
  }
}

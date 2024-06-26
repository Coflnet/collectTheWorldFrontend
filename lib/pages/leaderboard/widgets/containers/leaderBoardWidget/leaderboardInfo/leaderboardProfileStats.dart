import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderboardInfo/leaderboardActualStatsWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/profileStats/profileStatsWidget.dart';
import 'package:flutter/material.dart';

class LeaderboardProfileStats extends StatefulWidget {
  final String profileID;
  const LeaderboardProfileStats({super.key, required this.profileID});

  @override
  _LeaderboardProfileStatsState createState() =>
      _LeaderboardProfileStatsState();
}

class _LeaderboardProfileStatsState extends State<LeaderboardProfileStats> {
  int totalPic = 0;
  int totalXp = 0;
  int totalUnique = 0;
  int totalTopTen = 0;

  @override
  void initState() {
    super.initState();
    loadProfileStats();
  }

  void loadProfileStats() async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = StatsApi(client);
    try {
      final result = await apiInstance.getUserStats(widget.profileID);
      setState(() {
        totalXp =
            result![result.indexWhere((result) => result.statName == "exp")]
                .value!;
        totalPic = result[result
                .indexWhere((result) => result.statName == "images_uploaded")]
            .value!;
      });
    } catch (e) {
      print("errror request player stats in leaderboard $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(111, 99, 150, 1),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              const Text(
                "🎉 Achievements",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w700),
              ),
              const ProfileDivider(),
              LeaderboardActualStatsWidget(
                  totalPic: totalPic,
                  totalXp: totalXp,
                  totalUnique: totalUnique,
                  totalTopTen: totalTopTen),
            ],
          )),
    );
  }
}

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 10, 8, 16),
      width: double.infinity,
      height: 2,
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(10)),
    );
  }
}

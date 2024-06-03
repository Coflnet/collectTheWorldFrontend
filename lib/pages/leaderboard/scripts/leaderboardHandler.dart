import 'dart:math';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardFakeUserGen.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardFileHandler.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardRequestHandler.dart';
import 'package:intl/intl.dart';

class LeaderboardHandler {
  Future<List<dynamic>> getLeaderboard(int selectedPageId) async {
    List<dynamic> finalUsersList = [];
    List<dynamic> realUsersList = [];
    List leaderboardFileData =
        await LeaderboardFileHandler().getLeaderBoardData(selectedPageId);
    print(leaderboardFileData);
    DateTime fileTimeStamp = DateTime.parse(leaderboardFileData[0]);
    if (leaderboardFileData.length == 1 ||
        fileTimeStamp.isBefore(DateTime.now())) {
      realUsersList =
          await LeaderboardRequestHandler().loadLeaderBoard(selectedPageId);
    }
    finalUsersList.addAll(realUsersList);
    if (leaderboardFileData.length != 1) {
      leaderboardFileData.removeAt(0);
      finalUsersList.addAll(leaderboardFileData);
    }
    if (finalUsersList.length - 10 < 0) {
      finalUsersList.addAll(LeaderboardFakeUserGen()
          .generateFakeUsers(realUsersList.length - 10, selectedPageId));
    }

    List returnList = [];
    returnList.add(leaderboardFileData[0]);
    returnList.addAll(finalUsersList);
    LeaderboardFileHandler().updateCorrectData(returnList, selectedPageId);

    return finalUsersList;
  }
}

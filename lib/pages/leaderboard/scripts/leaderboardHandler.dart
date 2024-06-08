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
    List leaderboardFileData =
        await LeaderboardFileHandler().getLeaderBoardData(selectedPageId);

    finalUsersList =
        await validateRealUserCount(leaderboardFileData, selectedPageId);

    LeaderboardFileHandler().updateCorrectData(finalUsersList, selectedPageId);

    finalUsersList.sort((a, b) => b[1].compareTo(a[1]));

    return finalUsersList;
  }

  Future<List> validateRealUserCount(List leaderboardFileData, int id) async {
    if (leaderboardFileData.length > 1) {
      return leaderboardFileData;
    }

    List<dynamic> returnResult = [];
    var leaderBoardData = await LeaderboardRequestHandler().loadLeaderBoard(id);
    returnResult.addAll(leaderBoardData);
    if (returnResult.length - 10 <= 0) {
      returnResult.addAll(LeaderboardFakeUserGen()
          .generateFakeUsers(returnResult.length - 10, id));
      return returnResult;
    }
    return [];
  }
}

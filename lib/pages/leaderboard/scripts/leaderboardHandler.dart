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

    if (finalUsersList.length - 10 < 0) {
      print("gen fake\ngen fake\ngen fake\ngen fake");

      finalUsersList.addAll(LeaderboardFakeUserGen()
          .generateFakeUsers(realUsersList.length - 10, selectedPageId));
    }

    LeaderboardFileHandler().updateCorrectData(finalUsersList, selectedPageId);

    return finalUsersList;
  }

  Future<List> validateRealUserCount(List leaderboardFileData, int id) async {
    if (leaderboardFileData.length > 1) {
      return leaderboardFileData;
    }

    if (leaderboardFileData.length == 1) {
          return await LeaderboardRequestHandler().loadLeaderBoard(id);
    
    }
  }
}

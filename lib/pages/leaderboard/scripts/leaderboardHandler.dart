import 'dart:math';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/listCaching.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardFakeUserGen.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardFileHandler.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardRequestHandler.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/intl.dart';

List dailylb = [];
List weeklylb = [];
List alltimelb = [];

class LeaderboardHandler {
  Future<List<dynamic>> getLeaderboard(int selectedPageId) async {
    final List cachedList = checkCache(selectedPageId);
    if (cachedList.isNotEmpty) {
      return cachedList;
    }
    List<dynamic> finalUsersList = [];
    finalUsersList =
        await LeaderboardFileHandler().getLeaderBoardData(selectedPageId);

    finalUsersList = leaderBoardDeleteDups(finalUsersList);
    LeaderboardFileHandler().updateCorrectData(finalUsersList, selectedPageId);

    finalUsersList.sort((a, b) => b[1].compareTo(a[1]));
    saveCache(selectedPageId, finalUsersList);
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

  Future<List> refreshLeaderboard(int selection) async {
    var leaderBoardData =
        await LeaderboardRequestHandler().loadLeaderBoard(selection);
    leaderBoardData.sort((a, b) => b[1].compareTo(a[1]));
    List returnList = leaderBoardDeleteDups(leaderBoardData);
    LeaderboardFileHandler().updateCorrectData(returnList, selection);

    saveCache(selection, returnList);
    returnList = returnList.take(10).toList();
    
    return returnList;
  }

  List leaderBoardDeleteDups(List leaderboardData) {
    List userIds = [];
    List newLbData = [];
    for (List entry in leaderboardData) {
      if (entry[2] == null) {
        newLbData.add(entry);
        continue;
      }
      if (userIds.contains(entry[2])) {
        continue;
      }
      userIds.add(entry[2]);
      newLbData.add(entry);
    }
    return newLbData;
  }

  List checkCache(selection) {
    switch (selection) {
      case 1:
        return dailylb;
      case 2:
        return weeklylb;
      case 3:
        return alltimelb;
    }
    return [];
  }

  void saveCache(selection, newList) {
    switch (selection) {
      case 1:
        dailylb = newList;
      case 2:
        weeklylb = newList;
      case 3:
        alltimelb = newList;
    }
  }
}

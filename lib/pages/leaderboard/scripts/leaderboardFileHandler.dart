import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

bool fileLoadedYet = false;
List dailyFakeUsers = [];
List weeklyFakeUsers = [];
List allTimeFakeUsers = [];

class LeaderboardFileHandler {
  Future<List> getLeaderBoardData(int id) async {
    if (!fileLoadedYet) {
      await getFileData();
    }

    switch (id) {
      case 1:
        return dailyFakeUsers;
      case 2:
        return weeklyFakeUsers;
      case 3:
        return allTimeFakeUsers;
    }
    return [];
  }

  Future<int> getFileData() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return 0;
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/leaderBoardDetails.json";
    File file = File(filePath);
    if (!file.existsSync()) {
      await createFile(file);
    }

    try {
      var fileDataJson = file.readAsStringSync();
      var fileData = jsonDecode(fileDataJson);
      dailyFakeUsers = fileData["daily"];
      weeklyFakeUsers = fileData["weekly"];
      allTimeFakeUsers = fileData["allTime"];
      fileLoadedYet = true;
      return 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> createFile(file) async {
    try {
      file.createSync();
      DateTime now = DateTime.now();

      var fileData = {
        "daily": [],
        "weekly": [],
        "allTime": []
      };
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
    } catch (e) {
      print("creating filing in leaderboard file handler  $e");
    }
  }

  void storeFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/leaderBoardDetails.json";
    File file = File(filePath);
    var fileData = {
      "daily": dailyFakeUsers.toList(),
      "weekly": weeklyFakeUsers.toList(),
      "allTime": allTimeFakeUsers.toList()
    };
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
    
  }

  void updateCorrectData(List newList, int curSel) {
    switch (curSel) {
      case 1:
        dailyFakeUsers = newList;
      case 2:
        weeklyFakeUsers = newList;
      case 3:
        allTimeFakeUsers = newList;
    }
    storeFile();
  }
}

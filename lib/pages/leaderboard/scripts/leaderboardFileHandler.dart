import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LeaderboardFileHandler {
  bool fileLoadedYet = false;
  List dailyFakeUsers = [];
  List weeklyFakeUsers = [];
  List allTimeFakeUsers = [];

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
      createFile(file);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);
    dailyFakeUsers = fileData["daily"];
    weeklyFakeUsers = fileData["weekly"];
    allTimeFakeUsers = fileData["allTime"];
    fileLoadedYet = true;
    return 0;
  }

  void createFile(file) async {
    file.createSync();
    DateTime now = DateTime.now();
    String time =
        DateTime(now.year, now.month, now.day, 23, 59, 59).toIso8601String();
    var fileData = {
      "daily": [time].toList(),
      "weekly": [time].toList(),
      "allTime": [time].toList()
    };
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }
}

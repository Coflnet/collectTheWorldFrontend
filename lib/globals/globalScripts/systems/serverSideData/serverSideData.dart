import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

List dailyBonusesList = [1.25, 1.5, 2];
List leaderboardBaseRewardsList = [1000, 3000];
List leaderboardTopThree = [
  [3000, 2000, 1000],
  [6000, 3000, 2000]
];

class ServerSideData {
  Future<void> loadFileData() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return;
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/serverSideData.json";
    File file = File(filePath);
    if (!file.existsSync()) {
      await createFile(file);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);

    dailyBonusesList = fileData["dailyBonusesList"] ?? dailyBonusesList;
    leaderboardBaseRewardsList =
        fileData["leaderboardBaseRewardsList"] ?? leaderboardBaseRewardsList;
    leaderboardTopThree =
        fileData["leaderboardTopThree"] ?? leaderboardTopThree;
  }

  Future<void> createFile(file) async {
    file.createSync();
    var fileData = {
      "dailyBonusesList": dailyBonusesList,
      "leaderboardBaseRewardsList": leaderboardBaseRewardsList,
      "leaderboardTopThree": leaderboardTopThree
    };
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  void saveData() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/serverSideData.json";
    File file = File(filePath);
    var fileData = {
      "dailyBonusesList": dailyBonusesList,
      "leaderboardBaseRewardsList": leaderboardBaseRewardsList,
      "leaderboardTopThree": leaderboardTopThree
    };

    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }

  List get getDailyBonuses => dailyBonusesList;
  List get getLeaderboardBaseRewards => leaderboardBaseRewardsList;
  List get getLeaderboardTopThree => leaderboardTopThree;

  set setDailyBonuses(List newValue) => dailyBonusesList = newValue;
  set setLeaderboardBaseRewards(List newValue) =>
      leaderboardBaseRewardsList = newValue;
  set setLeaderboardTopThree(List newValue) => leaderboardTopThree = newValue;
}

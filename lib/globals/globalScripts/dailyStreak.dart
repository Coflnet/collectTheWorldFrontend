import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

int streak = 0;
DateTime lastUpdate = DateTime.now();
DateTime currentDayTime = DateTime.now();


class LoadDailyStreak {
  DateTime now = DateTime.now();

  void loadStreak() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/dailyStreak.json";
    File file = File(filePath);



    if (!file.existsSync()) {
      file.createSync();
      var fileData = {
        "dailyStreak": 0,
        "nextDayTime": DateTime(now.year, now.month, now.day, 23, 59, 59),
        "currentDayTime": DateTime(now.year, now.month, now.day, 23, 59, 59),
      };
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
    }

    var fileDatajson = await file.readAsString();
    var fileData = await jsonDecode(fileDatajson);

    streak = fileData.dailyStreak;
    currentDayTime = fileData.currentDayTime;
    checkStreakTime();
  }

  void checkStreakTime() {
    if (DateTime.now().isAfter(lastUpdate)) {
      streak = 0;
      saveStreakData();
    }
  }

  void saveStreakData() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir}/dailyStreak.json";
    File file = File(filePath);
    var fileData = {
      "dailyStreak": streak,
      "lastStreak": lastUpdate,
    };
    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }

  void updateDayTimes(){
    currentDayTime = DateTime(now.year, now.month, now.day, 47, 59, 59);
    currentDayTime = DateTime(now.year, now.month, now.day, 23, 59, 59);
    saveStreakData();
  }

}

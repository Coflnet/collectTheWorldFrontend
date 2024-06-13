import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

int streak = 0;
DateTime lastUpdate = DateTime.now();
DateTime currentDayTime = DateTime.now();
bool alreadyLoaded = false;

class LoadDailyStreak {
  void loadStreak() async {
    if (alreadyLoaded) {
      return;
    }
    DateTime now = DateTime.now();
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/dailyStreak.json";
    File file = File(filePath);
    file.deleteSync();

    if (!file.existsSync()) {
      file.createSync();
      var fileData = {
        "dailyStreak": 0,
        "currentDayTime": DateTime(now.year, now.month, now.day, 23, 59, 59)
            .toIso8601String(),
      };
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);

    streak = fileData["dailyStreak"];
    currentDayTime = DateTime.parse(fileData["currentDayTime"]);
    checkStreakTime();
    alreadyLoaded = true;
  }

  void checkStreakTime() {
    if (DateTime.now().isAfter(lastUpdate)) {
      streak = 0;
      saveStreakData();
    }
  }

  void saveStreakData() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/dailyStreak.json";
    File file = File(filePath);
    var fileData = {
      "dailyStreak": streak,
      "lastStreak": lastUpdate.toIso8601String(),
    };
    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }

  void updateDayTimes() {
    DateTime now = DateTime.now();
    currentDayTime = DateTime(now.year, now.month, now.day, 47, 59, 59);
    currentDayTime = DateTime(now.year, now.month, now.day, 23, 59, 59);
    saveStreakData();
  }

  int getStreak() {
    return streak;
  }
}

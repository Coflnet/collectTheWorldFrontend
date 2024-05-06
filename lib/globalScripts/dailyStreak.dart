import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:collect_the_world/globalWidgets/header/dailyStreak.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

int streak = 0;
DateTime lastUpdate = DateTime.now();

class LoadDailyStreak {
  DateTime now = DateTime.now();

  void loadStreak() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir}/dailyStreak.json";
    File file = File(filePath);

    if (!file.existsSync()) {
      file.createSync();
      var fileData = {
        "dailyStreak": 0,
        "lastUpdate": DateTime(now.year, now.month, now.day, 23, 59, 59)
      };
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
    }

    var fileDatajson = await file.readAsString();
    var fileData = await jsonDecode(fileDatajson);

    streak = fileData.dailyStreak;
    checkStreakTime();
  }

  void checkStreakTime() {
    if (DateTime.now().isAfter(lastUpdate)) {
      streak = 0;
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
}

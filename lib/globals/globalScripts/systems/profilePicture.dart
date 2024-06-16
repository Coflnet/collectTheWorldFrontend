import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';

String profileString = "";
int topThree = 0;
DateTime joinDate = DateTime.now();
String username = "anonymous";
int totalPicture = 0;
int totalUnique = 0;

class ProfileInfo {
  Future<String> loadProfileFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/profilePicutre.json";
    File file = File(filePath);

    if (!file.existsSync()) {
      file.createSync();
      var fileData = {
        "ProfileString": randomString(15),
        "Username": "anonymous",
        "JoinDate": DateTime.now().toIso8601String(),
        "TopThree": 3,
        "totalPicture": 0,
        "totalUnique": 0
      };
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);

    profileString = fileData["ProfileString"];
    username = fileData["Username"];
    joinDate = DateTime.parse(fileData["JoinDate"]);
    topThree = fileData["TopThree"];
    totalUnique = fileData["totalUnique"];
    totalPicture = fileData["totalPicture"];
    return "";
  }

  void saveFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/dailyStreak.json";
    File file = File(filePath);
    var fileData = {
      "ProfileString": profileString,
      "Username": username,
      "TopThree": topThree,
      "totalPicture": totalPicture,
      "totalUnique": totalUnique
    };
    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }
}

class ProfileRetrevial {
  String getProfileString() {
    return profileString;
  }

  int getTopThree() {
    return topThree;
  }

  DateTime getJoinDate() {
    return joinDate;
  }

  String getUsername() {
    return username;
  }
}

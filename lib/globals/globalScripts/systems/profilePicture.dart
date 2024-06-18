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
int totalXp = 0;

class ProfileInfo {
  Future<void> loadProfileFile() async {
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
        "totalUnique": 0,
        "totalXp": 0,
      };
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);

    profileString = fileData["ProfileString"];
    username = fileData["Username"];
    topThree = fileData["TopThree"];
    totalUnique = fileData["totalUnique"];
    totalPicture = fileData["totalPicture"];
    joinDate = DateTime.parse(fileData["JoinDate"]);
    return;
  }

  void saveFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/profilePicutre.json";
    File file = File(filePath);
    var fileData = {
      "ProfileString": profileString,
      "Username": username,
      "JoinDate": DateTime.now().toIso8601String(),
      "TopThree": topThree,
      "totalPicture": totalPicture,
      "totalUnique": totalUnique,
      "totalXp": totalXp
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

  int getUnqie() {
    return totalUnique;
  }

  int getTotal() {
    return totalPicture;
  }

  int getTotalXp() {
    return totalXp;
  }

  void setTotalXp(int newXP) {
    totalXp = newXP;
  }

  void setTotal(int newTotal) {
    totalPicture = newTotal;
  }

  void setUnqiue(int newTotal) {
    totalUnique = newTotal;
  }

  void setProfileString(String newprofileString) {
    profileString = newprofileString;
  }

  void setTopThree(int newtopThree) {
    topThree = topThree;
  }

  void setUsername(String newusername) {
    username = newusername;
  }
}

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

class LoadingProfileInfo {
  void load() {
    loadProfileFile();
  }

  Future<void> loadProfileFile() async {
    print("loading");
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/profilePicutre.json";
    File file = File(filePath);

    if (!file.existsSync()) {
      file.createSync();
      print("creating");
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
    print("saving file");
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/profilePicutre.json";
    File file = File(filePath);
    print(profileString);
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
    if (profileString == "") {
      return "ohno";
    }
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
    print(
        "WHY ARE WE SETTING\nWHY ARE WE SETTING\nWHY ARE WE SETTING\nWHY ARE WE SETTING\nnWHY ARE WE SETTING\nnWHY ARE WE SETTING\nnWHY ARE WE SETTING\nnWHY ARE WE SETTING\nnWHY ARE WE SETTING\nnWHY ARE WE SETTING\nnWHY ARE WE SETTING\nnWHY ARE WE SETTING\n");
    profileString = newprofileString;
  }

  void setTopThree(int newtopThree) {
    topThree = topThree;
  }

  void setUsername(String newusername) {
    username = newusername;
  }
}

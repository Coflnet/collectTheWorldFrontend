import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
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
bool statsLoaded = false;

class LoadingProfileInfo {
  void load() {
    loadProfileFile();
  }

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
        "TopThree": 0,
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
    totalXp = fileData["totalXp"];
    joinDate = DateTime.parse(fileData["JoinDate"]);
    return;
  }

  Future<void> loadStatsFromCloud() async {
    if (statsLoaded) {
      return;
    }
    statsLoaded = true;
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = StatsApi(client);
    try {
      final result = await apiInstance.getAllStats();
      totalXp = result![0].value ?? totalXp;
      
      saveFile();
    } catch (e) {
      print("error requesting stats in profile picture $e");
    }
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

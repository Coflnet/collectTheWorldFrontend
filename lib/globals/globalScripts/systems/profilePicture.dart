import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
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
int dailyStreak = 0;
int skipsRemaining = 0;
bool legalDone = false;

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
        "dailyStreak": 0,
        "skipsRemaining": 0,
        "legalDone": false
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
    dailyStreak = fileData["dailyStreak"];
    legalDone = fileData["legalDone"];
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
      final List<Stat>? result = await apiInstance.getAllStats();
      if (result == null) {
        return;
      }

      totalXp = getStatValue(result, 'exp');
      totalPicture = getStatValue(result, 'images_uploaded');
      totalUnique = getStatValue(result, 'unique_images_uploaded');
      dailyStreak = getStatValue(result, 'collection_streak');
      remainingSkips = getStatValue(result, 'skips_available');
      topThree = getStatValue(result, "daily_leaderboard_top10") +
          getStatValue(result, "weekly_leaderboard_top10");

      saveFile();
    } catch (e) {
      print("error in profile picture $e");
    }
  }

  int getStatValue(List result, String statName) {
    int index = result.indexWhere((item) => item.statName == statName);
    if (index == -1) {
      return 0;
    }
    return result[index].value ?? 0;
  }

  void saveFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/profilePicutre.json";
    File file = File(filePath);
    var fileData = {
      "ProfileString": profileString,
      "Username": username,
      "JoinDate": joinDate.toIso8601String(),
      "TopThree": topThree,
      "totalPicture": totalPicture,
      "totalUnique": totalUnique,
      "totalXp": totalXp,
      "dailyStreak": dailyStreak,
      "skipsRemaining": skipsRemaining,
      "legalDone": legalDone
    };
    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }
}

class ProfileRetrevial {
  bool get getLegalDone => legalDone;
  set setLegalDone(newValue) => legalDone = newValue;

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

  int getStreak() {
    return dailyStreak;
  }

  int getSkips() {
    return remainingSkips;
  }

  void setSkips(int newSkips) {
    remainingSkips = newSkips;
  }

  void setStreak(int newDailyStreak) {
    dailyStreak = newDailyStreak;
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

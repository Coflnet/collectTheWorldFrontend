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

    profileString = fileData["ProfileString"] ?? "";
    username = fileData["Username"] ?? "";
    topThree = fileData["TopThree"] ?? 0;
    totalUnique = fileData["totalUnique"] ?? 0;
    totalPicture = fileData["totalPicture"] ?? 0;
    totalXp = fileData["totalXp"] ?? 0;
    joinDate = DateTime.parse(fileData["JoinDate"]);
    dailyStreak = fileData["dailyStreak"] ?? 0;
    legalDone = fileData["legalDone"] ?? false;
    print(joinDate);
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

      totalXp = result[result.indexWhere((result) => result.statName == "exp")]
              .value ??
          0;
      assignTopThee(result);
      totalPicture = result[result
                  .indexWhere((result) => result.statName == "images_uploaded")]
              .value ??
          0;
      totalUnique = result[result.indexWhere(
                  (result) => result.statName == "unique_images_uploaded")]
              .value ??
          0;
      dailyStreak = result[result.indexWhere(
                  (result) => result.statName == "collection_streak")]
              .value ??
          0;
      remainingSkips = result[result
                  .indexWhere((result) => result.statName == "skips_available")]
              .value ??
          0;
      saveFile();
    } catch (e) {
      print("error requesting stats in profile picture $e");
    }
  }

  void assignTopThee(List result) {
    topThree = result[result.indexWhere(
                (result) => result.statName == "daily_leaderboard_top10")]
            .value ??
        0 +
            result[result.indexWhere(
                    (result) => result.statName == "weekly_leaderboard_top10")]
                .value;
  }

  void saveFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/profilePicutre.json";
    File file = File(filePath);
    var fileData = {
      "ProfileString": profileString,
      "Username": username,
      "JoinDate": joinDate,
      "TopThree": topThree,
      "totalPicture": totalPicture,
      "totalUnique": totalUnique,
      "totalXp": totalXp,
      "dailyStreak": dailyStreak,
      "skipsRemaining": skipsRemaining,
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

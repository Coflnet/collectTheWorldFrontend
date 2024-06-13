import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:path_provider/path_provider.dart';

var dailyChallenge;

class ChallengeCaching {
   Future<int> loadChallengeData() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return 0;
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/itemDetails.json";
    File file = File(filePath);
    if (!file.existsSync()) {
      createFile(file);
      int number = await requestChallenge();
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);
    dailyChallenge = fileData["dailyChallenge"];
    return 0;
  }

  Future<int> requestChallenge() async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = ChallengeApi(client);
    try {
      final result = await apiInstance.challenge();

      dailyChallenge = result!.challenges![0];
      return 0;
    } catch (e) {
      print("error in challengeCaching fetching $e");
      return 0;
    }
  }

  void createFile(file) async {
    file.createSync();
    var fileData = {"dailyChallenge": Challenge().toString()};
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  Future<Challenge> getDailyChallenge() async {

    if (dailyChallenge == null) {
      int number = await loadChallengeData();
    }
    return dailyChallenge;
  }
}

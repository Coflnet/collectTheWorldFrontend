import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:path_provider/path_provider.dart';

List<Challenge> dailyChallenge = [];

class ChallengeCaching {
  Future<void> loadChallengeData() async {
    if (dailyChallenge.isEmpty) {
      await requestChallenge();
    }
    return;
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

      dailyChallenge = result!.challenges!;
      return 0;
    } catch (e) {
      print("error in challengeCaching fetching $e");
      return 0;
    }
  }

  Future<List<Challenge>> getDailyChallenge() async {
    if (dailyChallenge.isEmpty) {
      await loadChallengeData();
    }
    return dailyChallenge;
  }
}

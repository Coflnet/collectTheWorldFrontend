import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';

int daily = 0;
int weekly = 0;
int allTime = 0;

class placementCaching {
  Future<void> loadPlacements() async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);

    final apiInstance = LeaderboardApi(client);

    try {
      RankSummary? result = await apiInstance.getRanks();
      if (result == null) {
        throw Exception("The result was null");
      }

      daily = (result.dailyRank == -1) ? 0 : result.dailyRank!;
      weekly = (result.weeklyRank == -1) ? 0 : result.weeklyRank!;
      allTime = (result.overallRank == -1) ? 0 : result.overallRank!;
    } catch (e) {
      print("there was an error requesting placementCaching $e");
    }
  }

  int get getDaily => daily;
  int get getWeekly => weekly;
  int get getAlltime => allTime;
}

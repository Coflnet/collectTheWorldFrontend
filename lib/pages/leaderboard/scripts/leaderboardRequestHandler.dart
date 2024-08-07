import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:intl/intl.dart';

class LeaderboardRequestHandler {
  String getLeaderBoardId(int variation) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');
    String formatedDate = formatter.format(now);
    switch (variation) {
      case 1:
      print("exp_daily_$formatedDate");
        return "daily";
      case 2:
        int currentWeekday = now.weekday;
        DateTime firstDayOfWeek =
            now.subtract(Duration(days: currentWeekday - 1));
        formatedDate = formatter.format(firstDayOfWeek);
        return "weekly";
      case 3:
        return "exp_overall";
    }
    return "null";
  }

  Future<List> loadLeaderBoard(int variation, {int offset = 0}) async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = LeaderboardApi(client);
    try {
      final result =
          await apiInstance.getLeaderboard(getLeaderBoardId(variation), offset: offset);
      if (result == null) {
        return [];
      }

      List returnList = [];

      for (var i in result) {
        String username = "";
        username = i.user?.name as String;
        if (i.user?.name == null) {
          username = "Anonymous";
        }
        returnList.add([username, i.score, i.user?.userId, i.user?.avatar]);
      }
      return returnList;
    } catch (e) {
      if (e is! ApiException) {
        print(
            'Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
        return [];
      }
      if (e.code == 401) {
        await Authclient().generateToken();
        return await loadLeaderBoard(variation);
      }

      print('Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
      return [];
    }
  }
}

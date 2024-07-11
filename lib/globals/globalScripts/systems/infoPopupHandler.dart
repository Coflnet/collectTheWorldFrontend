import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';

List newInfo = [];

List allAcceptedTypes = ["leaderboard", "challenge", "deduction"];

class InfoPopupHandler {
  void requestPopup() async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = ExpApi(client);
    try {
      final result = await apiInstance.getExpChanges() ?? [ExpChange()];

      if (result.isEmpty) {
        return;
      }
      
      for (var info in result) {
        if (allAcceptedTypes.contains(info.source_)) {
          newInfo.add(info);
        }
      }
    } catch (e) {
      print("error requesting request popup failed $e");
    }
  }

  List get getNewInfo => newInfo;
}

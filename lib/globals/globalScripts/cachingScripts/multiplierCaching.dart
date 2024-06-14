import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:path_provider/path_provider.dart';

List<ActiveMultiplier> multipliers = [];
bool isloaded = false;

class MultiplierCaching {
  loadMultiplier() async {
    if (isloaded) {
      return 0;
    }
    multipliers = (await reqeustMultipliers())!;
  }

  Future<List<ActiveMultiplier>?> reqeustMultipliers() async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = MultiplierApi(client);
    try {
      final result = await apiInstance.multiplier();
      return result?.multiplier;
    } catch (e) {
      print("error requesting multipliers in request Mulitpliers $e");
      return [];
    }
  }

  List<ActiveMultiplier> getMultiplier() {
    return multipliers;
  }
}

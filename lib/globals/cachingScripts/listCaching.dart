import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;
import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:path_provider/path_provider.dart';

class ListCaching {
  late dynamic cache = {};
  late DateTime lastUpdate = DateTime.now();

  Future<Set> getCache() async {
    return await loadCache();
  }

  Future<Set> loadCache() async {
    if (cache.isNotEmpty) {
      return cache;
    }

    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/listCache.json";
    File file = File(filePath);

    if (!file.existsSync()) {
      file.createSync();

      var fileData = {
        "listCache": {},
      };
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
    }

    var fileDatajson = await file.readAsString();
    var fileData = await jsonDecode(fileDatajson);
    cache = fileData["listCache"];
    lastUpdate = DateTime.parse(fileData["currentDayTime"]);
    return await checkUpdateTime();
  }

  Future<Set> checkUpdateTime() async {
    if (cache.isEmpty) {
      return await reguestNewList();
    }
    return cache;
  }

  Future<Set> reguestNewList() async {
    var token = (await authclie.Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = ObjectApi(client);
    List<CollectableObject>? result;
    try {
      result = await apiInstance.getChellenge(count: 10);
    } catch (e) {
      if (e is! ApiException) {
        print(
            'Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
        return {};
      }
      if (e.code == 401) {
        await Authclient().generateToken();
        return await reguestNewList();
      }

      print('Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
      return {};
    }
    Set<dynamic> newList = {};

    for (var i in result!) {
      var rng = Random();
      int xp = rng.nextInt(30);
      newList.add({"name": i.name, "xp": xp});
    }
    cache = newList;
    saveData();
    return cache;
  }

  void saveData() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/listCache.json";
    File file = File(filePath);
    var fileData = {
      "listCache": cache,
    };
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  void checkIfItemUpdated() {
    reguestNewList();
  }
}

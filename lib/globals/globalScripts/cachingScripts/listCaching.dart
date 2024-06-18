import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;
import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:path_provider/path_provider.dart';

List cache = [];
DateTime lastUpdate = DateTime.now();
bool alreadyRequested = false;

class ListCaching {
  Future<Set> getCache() async {
    return await loadCache();
  }

  Future<Set> loadCache() async {
    if (cache.isNotEmpty) {
      return cache.toSet();
    }
    reguestNewList();
    return {};
  }

  Future<List?> checkUpdateTime() async {
    if (cache.isEmpty) {
      return await reguestNewList();
    }
    return cache;
  }

  Future<List?> reguestNewList() async {
    var token = (await authclie.Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = ObjectApi(client);
    List<CollectableObject>? result;
    try {
      result = await apiInstance.getDailyObject();
      cache = result ?? [];
      print(cache);
      return result;
    } catch (e) {
      if (e is! ApiException) {
        print(
            'Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
        return [];
      }
      if (e.code == 401) {
        await Authclient().generateToken();
        return await reguestNewList();
      }

      print('Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
      return [];
    }
    
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
    if (!alreadyRequested) {
      reguestNewList();
      alreadyRequested = true;
    }
  }
}

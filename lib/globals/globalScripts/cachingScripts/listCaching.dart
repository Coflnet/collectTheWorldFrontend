import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;
import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:path_provider/path_provider.dart';

List cache = [];
List newestCache = [];
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

  Set loadNewestCache() {
    if (cache.isNotEmpty) {
      return newestCache.toSet();
    }
    return {};
  }

  Future<Set> loadNewestOffset(int offset) async {
    var token = (await authclie.Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = ObjectApi(client);

    try {
      List<CollectableObject>? result =
          await apiInstance.getNewObjects(offset: offset);
      return result?.toSet() ?? {};
    } catch (e) {
      print("exception loading newest list offset $e");
    }
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
    reqeustNewest(apiInstance);
    List<CollectableObject>? result;
    try {
      result = await apiInstance.getDailyObject();
      cache = result ?? [];
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

  void reqeustNewest(ObjectApi instance) async {
    try {
      List<CollectableObject>? result = await instance.getNewObjects();
      newestCache = result ?? [];
      print(newestCache);
    } catch (e) {
      print("error requesting newest list $e");
    }
  }

  void checkIfItemUpdated() {
    if (!alreadyRequested) {
      reguestNewList();
      alreadyRequested = true;
    }
  }
}

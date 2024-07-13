import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;
import 'package:path_provider/path_provider.dart';

var currentItem = "nil";
int remainingSkips = 10;

class ItemToFindHandler {
  String returnCurrentItem() {
    return currentItem == "nil" ? "" : currentItem;
  }

  Future<String> loadFileData() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return "";
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/itemDetails.json";
    File file = File(filePath);
    if (!file.existsSync()) {
      await createFile(file);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);
    currentItem = fileData["currentItem"];
    remainingSkips = fileData["skips"];
    if (currentItem == "") {
      currentItem = (await fetchNewItem())!;
    }
    return currentItem;
  }

  Future<String?> getCurrentItem() async {
    if (currentItem == "nil") {
      return await loadFileData();
    }
    if (currentItem == "") {
      return await getNewItem();
    }
    return currentItem;
  }

  Future<String?> fetchNewItem() async {
    return await getNewItem();
  }

  Future<String?> getNewItem() async {
    token = (await authclie.Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);

    final api_instance = ObjectApi(client);

    try {
      final result = await api_instance.getNextObject();
      String? name = result?.name;
      currentItem = name!;
      saveData();
      return name;
    } catch (e) {
      if (e is! ApiException) {
        print(
            'Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
        return "There's a error";
      }
      if (e.code == 401) {
        await Authclient().generateToken();
        return await getNewItem();
      }

      print('Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
      return "There's a error";
    }
  }

  Future<void> createFile(file) async {
    file.createSync();
    var fileData = {"currentItem": "", "skips": 2};
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  void saveData() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/itemDetails.json";
    File file = File(filePath);
    var fileData = {"currentItem": currentItem, "skips": remainingSkips};

    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }

  Future<int> skipItem(String itemName) async {
    token = (await authclie.Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = SkipApi(client);
    try {
      await apiInstance.skip(itemName);
      return 1;
    } catch (e) {
      print('Exception when calling SkipApi: $e\n');
      return 0;
    }
  }

  Future<int> getRemainingSkips() async {
    if (remainingSkips == 10) {
      String result = await loadFileData();
      return remainingSkips;
    }
    return remainingSkips;
  }

  int returnRamaingSkips() {
    return remainingSkips;
  }

  void setRemainingSkips(int requestRemainingSkips) {
    remainingSkips = requestRemainingSkips;
  }

  void reduceRemaingSkips() {
    remainingSkips--;
  }

  void handleNewRemaingSkip() {
    if (remainingSkips == 2) {
      return;
    }
    remainingSkips++;
  }

  Future<int?> requestRemainingSkips() async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = SkipApi(client);
    try {
      final result = await apiInstance.available();
      return result?.total;
    } catch (e) {
      if (e is! ApiException) {
        print(
            'Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
        return 0;
      }
      if (e.code == 401) {
        await Authclient().generateToken();
        return await getRemainingSkips();
      }
      print("error fetching remaining skips $e");
      return 0;
    }
  }
}

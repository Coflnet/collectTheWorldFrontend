import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;
import 'package:path_provider/path_provider.dart';

var currentItem = "nil";

class ItemToFindHandler {
  Future<String> loadFileData() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return "";
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/itemDetails.json";
    File file = File(filePath);

    if (!file.existsSync()) {
      createFile(file);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);

    currentItem = fileData["currentItem"];
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
    print("requesting new item\nrequesting new item\nrequesting new item");
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
        return "error";
      }
      if (e.code == 401) {
        await Authclient().generateToken();
        return await getNewItem();
      }

      print('Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
      return "error";
    }
  }

  void createFile(file) async {
    file.createSync();
    var fileData = {"currentItem": ""};
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  void saveData() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/itemDetails.json";
    File file = File(filePath);
    var fileData = {
      "currentItem": currentItem,
    };

    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }

  Future<void> skipItem() async {
    token = (await authclie.Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = SkipApi(client);
    try {
      final result = await apiInstance.skip("smart home");
      print(result);
    } catch (e) {
      print('Exception when calling SkipApi: $e\n');
    }
  }

  Future<void> skipItemAsync() async {
    final completer = Completer<void>();

    await skipItem();

    completer.complete();
    return completer.future;
  }
}

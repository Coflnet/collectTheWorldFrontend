import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/authClient.dart'
    as authclie;
import 'package:path_provider/path_provider.dart';

var currentItem = {};
var collectedItems = {};

class itemDetails {
  void loadFileData() async {
    print(
        "hkshdkhahkhasdh\nhkshdkhahkhasdh\nhkshdkhahkhasdh\nhkshdkhahkhasdh\n");
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return;
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/itemDetails.json";
    File file = File(filePath);

    if (!file.existsSync()) {
      createFile(file);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);

    collectedItems = fileData.collectedItems;
    currentItem = fileData.currentItem;
  }

  String getCurrentItem() {
    if (currentItem == {}) {
      getNewItem();
      return currentItem["name"];
    }
    if (DateTime.now().isAfter(currentItem["timeStamp"])) {
      getNewItem();
      return currentItem["name"];
    }
    return currentItem["name"];
  }

  void getNewItem() async {
    token = authclie.Authclient().tokenRequest();
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);

    final api_instance = ObjectApi(client);

    try {
      final result = await api_instance.apiObjectsCategoriesGet();
      print(result);
    } catch (e) {
      print('Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
    }
  }

  void createFile(file) async {
    file.createSync();
    var fileData = {"currentItem": {}, "collectedItems": {}};
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  void saveStreakData() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir}/itemDetails.json";
    File file = File(filePath);
    var fileData = {
      "currentItem": currentItem,
      "collectedItems": collectedItems
    };

    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:path_provider/path_provider.dart';

var currentItem = {};
var collectedItems = {};

class itemDetails {
  void getCurrentItem() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return;
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir}/itemDetails.json";
    File file = File(filePath);

    if (!file.existsSync()) {
      createFile(file);
    }
  }

  void getNewItem() {
    final api_instance = ObjectApi();

    try {
      final result = api_instance.apiObjectsCategoriesGet();
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

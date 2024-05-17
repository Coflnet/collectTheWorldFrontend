import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

var collectItem = [];

class loadingSave {
  void load() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/collectedItems.json";
    File file = File(filePath);

    if (!file.existsSync()) {
      file.createSync();
      var fileData = {"collectItems": []};
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
    }
    var fileDatajson = await file.readAsString();
    var fileData = await jsonDecode(fileDatajson);
    collectItem = fileData.collectItems;
  }

  void save(String data) async {
    collectItem.add(data);
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/collectedItems.json";
    File file = File(filePath);
    var fileData = {"collectItems": collectItem};
    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }
}

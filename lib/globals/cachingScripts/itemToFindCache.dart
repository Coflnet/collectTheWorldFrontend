


import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ItemToFindCache{

  late String itemName; 

  void loadData() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/listCache.json";
    File file = File(filePath);

    if (!file.existsSync()) {
      file.createSync();

      var fileData = {
        "itemName": "",
      };
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
    }

    var fileDatajson = await file.readAsString();
    var fileData = await jsonDecode(fileDatajson);
    itemName = fileData["itemName"];
  }

}
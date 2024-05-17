import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

void Save(
    String fileName, List<dynamic> fileData, List<dynamic> BaseData) async {
  Directory appDir = await getApplicationDocumentsDirectory();
  String filePath = "${appDir.path}/$fileName";
  File file = File(filePath);

  if (!file.existsSync()) {
    file.createSync();
    var jsonFileData = jsonEncode(BaseData);
    await file.writeAsString(jsonFileData);
  }
}

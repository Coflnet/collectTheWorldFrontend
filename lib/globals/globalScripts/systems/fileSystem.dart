import 'dart:convert';

class FileSystem {
  Future<int> createFile(file, fileData) async {
    file.createSync();
    var fileData = {"currentItem": ""};
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
    return 0;
  }
}

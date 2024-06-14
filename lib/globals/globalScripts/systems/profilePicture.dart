import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';

String profileString = "";

class ProfilePicture {
  Future<String> getProfileString() async {
    if (profileString != "") {
      return profileString;
    }
    return await loadProfileFile();
  }

  Future<String> loadProfileFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/dailyStreak.json";
    File file = File(filePath);

    if (!file.existsSync()) {
      file.createSync();
      var fileData = {
        "ProfileString": randomString(15),
      };
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);

    profileString = fileData["ProfileString"];

    return "";
  }

  void saveFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/dailyStreak.json";
    File file = File(filePath);
    var fileData = {
      "ProfileString": profileString,
    };
    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }
}

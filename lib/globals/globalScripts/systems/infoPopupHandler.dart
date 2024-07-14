import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:path_provider/path_provider.dart';

List newInfo = [];

List allAcceptedTypes = ["leaderboard", "challenge", "deduction"];

List alreadyLoadedPopups = [];

class InfoPopupHandler {
  void requestPopup() async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = EventsApi(client);
    try {
      final result = await apiInstance.getExpChanges() ?? [ChangeEvent()];

      if (result.isEmpty) {
        return;
      }


      for (var info in result) {
        if (alreadyLoadedPopups.contains(info.time.toString())) {

          continue;
        }
        if (allAcceptedTypes.contains(info.source_)) {
          newInfo.add(info);
        }
      }
      alreadyLoadedPopups =
          result.map((result) => result.time?.toString()).toList();
      saveData();
    } catch (e) {
      print("error requesting request popup failed $e");
    }
  }

  void loadFileData() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return;
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/infoPopup.json";
    File file = File(filePath);
    
    if (!file.existsSync()) {
      await createFile(file);
    }
    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);
    alreadyLoadedPopups = fileData["alreadyFound"];
  }

  void saveData() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/infoPopup.json";
    File file = File(filePath);
    var fileData = {"alreadyFound": alreadyLoadedPopups};

    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }

  Future<void> createFile(file) async {
    file.createSync();
    var fileData = {"alreadyFound": []};
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  List get getNewInfo => newInfo;
  set setNewInfo(List value) => newInfo = value;
}

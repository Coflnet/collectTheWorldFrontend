import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:path_provider/path_provider.dart';

ConsentData optionsChosen = ConsentData();
bool isChanged = false;
bool alreadyAgrreed = false;

class LegalChangeUploader {
  void submiteChanges() async {
    if (!isChanged) {
      return;
    }
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final api_instance = PrivacyApi(client);
    optionsChosen.givenAt = DateTime.now();
    try {
      await api_instance.saveConsent(consentData: optionsChosen);
      isChanged = false;
      alreadyAgrreed = true;
      saveData();
    } catch (e) {
      print("there was an error uploading the privacy changes $e");
    }
  }

  void loadFileData() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return;
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/legalInfo.json";
    File file = File(filePath);
    if (!file.existsSync()) {
      await createFile(file);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);
    optionsChosen = ConsentData(
      targetedAds: fileData["options"]['targetedAds'],
      tracking: fileData["options"]['tracking'],
      allowResell: fileData["options"]['allowResell'],
      analytics: fileData["options"]['analytics'],
      newService: fileData["options"]['newService'],
    );
    alreadyAgrreed = fileData["alreadyAgreed"] ?? false;
  }

  Future<void> createFile(file) async {
    file.createSync();
    var fileData = {
      "options": ConsentData(
              targetedAds: true,
              tracking: true,
              allowResell: true,
              analytics: true,
              newService: true)
          .toJson(),
      "alreadyAgreed": false,
    };
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  void saveData() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/legalInfo.json";
    File file = File(filePath);
    var fileData = {"options": optionsChosen, "alreadyAgreed": true};

    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }

  void makeChange(int whichOne, value) {
    switch (whichOne) {
      case 1:
        optionsChosen.givenAt = value;
      case 2:
        optionsChosen.targetedAds = value;
      case 3:
        optionsChosen.tracking = value;
      case 4:
        optionsChosen.analytics = value;
      case 5:
        optionsChosen.allowResell = value;
      case 6:
        optionsChosen.newService = value;
    }
  }

  bool getWhich(int whichOne) {
    switch (whichOne) {
      case 2:
        return optionsChosen.targetedAds ?? true;
      case 3:
        return optionsChosen.tracking ?? true;
      case 4:
        return optionsChosen.analytics ?? true;
      case 5:
        return optionsChosen.allowResell ?? true;
      case 6:
        return optionsChosen.newService ?? true;
      default:
        return true;
    }
  }

  set userId(String value) => optionsChosen.userId = value;
  set givenAt(DateTime value) => optionsChosen.givenAt = value;
  set targetedAds(bool value) => optionsChosen.targetedAds = value;
  set tracking(bool value) => optionsChosen.tracking = value;
  set analytics(bool value) => optionsChosen.analytics = value;
  set allowResell(bool value) => optionsChosen.allowResell = value;
  set newService(bool value) => optionsChosen.newService = value;
  set setIsChanged(bool value) => isChanged = value;
  String? get getuserId => optionsChosen.userId;
  DateTime? get getgivenAt => optionsChosen.givenAt;
  bool? get gettargetedAds => optionsChosen.targetedAds;
  bool? get gettracking => optionsChosen.tracking;
  bool? get getanalytics => optionsChosen.analytics;
  bool? get getallowResell => optionsChosen.allowResell;
  bool? get getnewService => optionsChosen.newService;
  bool get getAlreadyAgreed => alreadyAgrreed;
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;
import 'package:path_provider/path_provider.dart';

var currentItem = "";
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
    await file.delete();

    if (!file.existsSync()) {
      createFile(file);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);

    collectedItems = fileData["collectedItems"];
    currentItem = fileData["currentItem"];
  }

  Future<String?> getCurrentItem() async {
    if (currentItem.isEmpty) {
      return await getNewItem();
    }
    if (DateTime.now().isAfter(DateTime.now())) {
      return await getNewItem();
    }
    return currentItem;
  }

  Future<String?> fetchNewItem() async {
    return await getNewItem();
  }

  Future<String?> getNewItem() async {
    token = (await authclie.Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);

    final api_instance = ObjectApi(client);

    try {
      final result = await api_instance.getNextObject();
      print(result);
      String? name = result?.name;
      currentItem = name!;
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




//Expanded(
//        child: AttentionWidget(
//            child: Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: [
//        Container(
//            margin: const EdgeInsets.fromLTRB(24, 18, 0, 8),
//            child: Text(
//              "🔎 Item to find",
//              style: TextStyle(
//                  color: Colors.white.withOpacity(0.85),
//                  fontFamily: "PTSans",
//                  fontSize: 25,
//                  fontWeight: FontWeight.w500),
//            )),
//        Container(
//          margin: const EdgeInsets.symmetric(horizontal: 24),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: [
//              Expanded(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: [
//                    Container(
//                      margin: const EdgeInsets.only(top: 4),
//                      child: loaded
//                          ? AutoSizeText(
//                              maxLines: 1,
//                              textAlign: TextAlign.start,
//                              itemName,
//                              style: TextStyle(
//                                  color: Colors.white.withOpacity(0.9),
//                                  fontWeight: FontWeight.bold,
//                                  fontSize: 30),
//                            )
//                          : LoadingAnimationWidget.inkDrop(
//                              color: Colors.white, size: 45),
//                    ),
//                    SkipButton(
//                      parentCallBack: skipConfirmed,
//                      parentCallBackStarted: skipStarted,
//                    )
//                  ],
//                ),
//              ),
//              const CameraButton()
//            ],
//          ),
//        )
//      ],
//    )));
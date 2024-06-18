import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/multiplierCaching.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string_generator/random_string_generator.dart';

String token = "";
var secret = "";
final client = ApiClient(basePath: "https://ctw.coflnet.com");
bool alreadyLoaded = false;
DateTime creationDate = DateTime.now();

class Authclient {
  Future<String?> initClient() async {
    print(alreadyLoaded);
    if (alreadyLoaded) {
      return token;
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/clientDetail.json";
    File file = File(filePath);

    if (!await appDir.exists()) {
      await appDir.create(recursive: true);
    }

    if (!await file.exists()) {
      file.createSync(recursive: true);
      var fileData = {"token": "", "secret": ""};
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
      generateSecret();
      storeData();
    }
    var fileDatajson = await file.readAsString();
    var fileData = await jsonDecode(fileDatajson);
    creationDate = DateTime.parse(fileData["creationDate"]);
    secret = fileData["secret"];
    if (creationDate.isAfter(DateTime.now())) {
      return fileData["token"];
    }
    var returnToken = await generateToken();

    token = fileData["token"];
    alreadyLoaded = true;
    return returnToken;
  }

  void generateSecret() {
    var generator =
        RandomStringGenerator(fixedLength: 36, mustHaveAtLeastOneOfEach: true);
    secret = generator.generate();
  }

  Future<String?> generateToken() async {
    final apiInstance = AuthApi(client);
    final loginRequest = AnonymousLoginRequest(secret: secret, locale: "en");
    try {
      final response =
          await apiInstance.login(anonymousLoginRequest: loginRequest);
      token = response!.token!;
      DateTime now = DateTime.now();
      creationDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
      storeData();
      return token;
    } catch (e) {
      print("there was a error generating new token: $e");
      return "";
    }
  }

  void storeData() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/clientDetail.json";
    File file = File(filePath);
    var fileData = {
      "token": token,
      "secret": secret,
      "creationDate": creationDate.toIso8601String(),
    };
    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }

  Future<String?> tokenRequest() async {
    if (token == "") {
      return await initClient();
    }
    return token;
  }
}

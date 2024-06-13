import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string_generator/random_string_generator.dart';

String token = "";
var secret = "";
final client = ApiClient(basePath: "https://ctw.coflnet.com");
bool alreadyLoaded = false;

class Authclient {
  Future<String?> initClient() async {
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
    secret = fileData["secret"];
    var returnToken = await generateToken();
    storeData();

    token = fileData["token"];
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
      final response = await apiInstance.login(
          anonymousLoginRequest: loginRequest);
      token = response!.token!;
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
    };
    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }

  Future<String?> tokenRequest() async {
    if (token == ""){
      return await initClient();
    }
    return token;
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string_generator/random_string_generator.dart';

String token = "";
var secret = "";
final client = ApiClient(basePath: "https://ctw.coflnet.com");

class Authclient {
  void initClient() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return;
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/clientDetail.json";
    File file = File(filePath);

    if (!await appDir.exists()) {
      await appDir.create(recursive: true);
    }

    if (!await file.exists()) {
      print(
          "ljwehrkuwherklhwethqwiouh\nljwehrkuwherklhwethqwiouh\nljwehrkuwherklhwethqwiouh\n");
      file.createSync(recursive: true);
      var fileData = {"token": "", "secret": ""};
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
      generateSecret();
      storeData();
    }
    var fileDatajson = await file.readAsString();
    var fileData = await jsonDecode(fileDatajson);
    secret = fileData.secret;
    generateToken();
    storeData();

    token = fileData.token;
  }

  void generateSecret() {
    var generator =
        RandomStringGenerator(fixedLength: 36, mustHaveAtLeastOneOfEach: true);
    secret = generator.generate();
  }

  void generateToken() async {
    final apiInstance = AuthApi(client);
    final loginRequest = AnonymousLoginRequest(secret: secret, locale: "en");
    try {
      final response = await apiInstance.apiAuthAnonymousPost(
          anonymousLoginRequest: loginRequest);
      token = response!.token!;
      print(token);
    } catch (e) {
      print("there was a error generating new token: $e");
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

  String tokenRequest() {
    if (token == ""){
      initClient();
      return token;
    }
    return token;
  }
}

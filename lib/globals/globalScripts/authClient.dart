import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string_generator/random_string_generator.dart';

String token = "";
var secret = "";

class Authclient {
  void initClient() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return;
    }
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir}/clientDetails.json";
    File file = File(filePath);

    if (!file.existsSync()) {
      file.createSync();
      var fileData = {"token": "", "secret": ""};
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
      generateSecret();
      storeData();
    }
    generateToken();
    storeData();
    var fileDatajson = await file.readAsString();
    var fileData = await jsonDecode(fileDatajson);

    token = fileData.token;
    secret = fileData.secret;
    
    print(token);
  }

  void generateSecret() {
    var generator =
        RandomStringGenerator(fixedLength: 20, mustHaveAtLeastOneOfEach: true);
    secret = generator.generate();
  }

  void generateToken() async {
    final apiInstance = AuthApi();
    final loginRequest = AnonymousLoginRequest(secret: secret, locale: "en");
    try {
      final response = await apiInstance.apiAuthAnonymousPost(
          anonymousLoginRequest: loginRequest);
      token = response!.token!;
    } catch (e) {
      print("there was a error generating new token: $e");
    }
  }

  void storeData() async {
        Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir}/clientDetails.json";
    File file = File(filePath);
    var fileData = {
      "token": token,
      "secret": secret,
    };
    var fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }

}

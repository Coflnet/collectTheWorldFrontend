import 'dart:convert';

import "package:collect_the_world/globals/globalScripts/globals.dart"
    as globals;

import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/dailyStreak.dart'
    as dailyStreakScript;
import 'package:http/http.dart' as http;


class imageUploader {

  bool finnishedLoading = false;
  String objectId = "";

  void makeHttpCall() async {
    var image = await globals.image!.readAsBytes();
    var url = Uri.parse("https://ctw.coflnet.com/api/images/apple");

    var request = http.MultipartRequest("POST", url);
    var token = (await authclie.Authclient().tokenRequest())!;
    
    request.headers["Authorization"] = 'Bearer $token';

    request.files.add(http.MultipartFile.fromBytes(
      'image',
      image,
      filename: 'image.jpg',
    ));
    var response = await request.send();

    if (response.statusCode == 200) {
      finnishedLoading = true;
      var responseString = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseString);

      objectId = jsonResponse["id"];

      if (dailyStreakScript.lastUpdate.isAfter(DateTime.now())) {
        dailyStreakScript.streak = 0;
        dailyStreakScript.LoadDailyStreak().updateDayTimes();
      }
      dailyStreakScript.streak += 1;
      dailyStreakScript.LoadDailyStreak().updateDayTimes();
    } else {
      if (response.statusCode == 401) {
        await Authclient().generateToken();
        makeHttpCall();
        return;
      }

      print('Exception when calling api/images: ${response.statusCode}\n');
    }
  }
}

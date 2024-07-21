import 'dart:io';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/accountDeletionHandler.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/loadingPages/appStartupLoading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restart/restart.dart';

class DeleteProfilePopup extends StatelessWidget {
  final VoidCallback close;

  const DeleteProfilePopup({super.key, required this.close});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black38,
      child: Center(
        child: baseWidget(
          child: Container(
            height: 300,
            margin: const EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                const Text(
                  "⚠️PROCEED WITH CAUTION⚠️",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "by proceeding we will erase \nall of your personal data stored\n by Collect Whe World\n their will be a grace period\n of 3 days and you can contact support\n either in discord or our email",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                const Expanded(child: SizedBox()),
                Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(119, 80, 119, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextButton(
                        onPressed: deleteAccount,
                        child: Text(
                          "🛑Delete Account🛑",
                          style: TextStyle(
                              color: Colors.red[400],
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ))),
                const SizedBox(height: 12),
                Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(119, 80, 119, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextButton(
                        onPressed: close,
                        child: const Text(
                          "Go Back",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ))),
                const SizedBox(height: 16)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteAccount() async {
    var token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);

    final apiInstance = PrivacyApi(client);
    try {
      final result = await apiInstance.deleteAccount();
      accountDeletionHandler().deleteFrontEndData();
      close();
    } catch (e) {
      print("error deleting account $e");
    }
  }
}

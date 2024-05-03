import 'package:collect_the_world/globals.dart' as globals;
import 'dart:convert';
import 'dart:ui';
import 'package:collect_the_world/cameraScene/finalConformation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url = "http://10.0.0.19:6969";

class ConfirmButton extends StatelessWidget {
  final String searchBarContent;
  final bool isHttpRequest;

  const ConfirmButton(
      {super.key, required this.searchBarContent, required this.isHttpRequest});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: 83,
              height: 83,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 207, 207, 207).withOpacity(0.04),
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                    color: const Color.fromARGB(43, 255, 255, 255), width: 0.7),
              ),
              child: IconButton(
                  onPressed: () => {handleButtonPress(context)},
                  icon: const Icon(
                    Icons.check_rounded,
                    color: Colors.orange,
                    size: 60,
                  )),
            ),
          ),
        ));
  }

  void handleButtonPress(context) async {
    if (isHttpRequest) {
      makeHttpRequest();
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FinalConformationScene(itemName: searchBarContent)));
  }

  void makeHttpRequest() async {
    var image = await globals.image!.readAsBytes();
    var image64 = base64Encode(image);

    var dataToSend = {"image": image64, 'name': searchBarContent};
    String jsonDataToSend = jsonEncode(dataToSend);
    final response = await http.post(
        Uri.parse("http://10.0.0.19:8080/api/ctw/proccess"),
        headers: {'Content-Type': 'application/json'},
        body: jsonDataToSend);
    if (response.statusCode == 200) {
      print("yay");
    }
  }
}

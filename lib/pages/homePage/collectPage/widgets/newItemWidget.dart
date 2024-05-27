import 'dart:io';

import 'package:camera/camera.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:flutter/material.dart';

class NewItemWidget extends StatefulWidget {
  final String name;
  final int xp;
  final int index;

  const NewItemWidget({required this.name, this.xp = 25, required this.index});

  @override
  NewItemWidgetState createState() => NewItemWidgetState();
}

class NewItemWidgetState extends State<NewItemWidget> {
  late CameraController _controller;
  late var cameras;

  Future<void> _initializeCamera() async {
    if (Platform.isAndroid || Platform.isIOS) {
      cameras = await availableCameras();
      _controller = CameraController(cameras.first, ResolutionPreset.high);
      await _controller.initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: TextButton(
        onPressed: () {
          changeScene(context);
        },
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(2, 0, 3, 0),
                    child: Text(
                      "${widget.index + 1}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Icon(
                    Icons.check_box_outline_blank,
                    size: 40,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 243, 247),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const Text(
                    "50XP",
                    style: TextStyle(
                        fontFamily: "Robik-Light",
                        fontSize: 20,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeScene(context) async {
    await _initializeCamera();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraScreen(
                  controller: _controller,
                  dailyWeeklyItem: true,
                  itemName: widget.name,
                )));
  }
}

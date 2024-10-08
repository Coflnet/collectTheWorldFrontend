import 'dart:io';

import 'package:camera/camera.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CameraButton extends StatefulWidget {
  const CameraButton({super.key});

  @override
  _CollectItemCameraButtonState createState() =>
      _CollectItemCameraButtonState();
}

class _CollectItemCameraButtonState extends State<CameraButton> {
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
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 14, 12, 0),
            width: 85,
            height: 85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: HexColor("4A4EBA"),
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: -5,
                      color: Colors.black38,
                      offset: Offset(10, 10),
                      blurRadius: 40)
                ]),
            child: IconButton(
                onPressed: () => changeScene(context),
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 48,
                  color: HexColor("BDBACC"),
                )),
          ),
        ],
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
                  itemName: ItemToFindHandler().returnCurrentItem(),
                )));
  }
}

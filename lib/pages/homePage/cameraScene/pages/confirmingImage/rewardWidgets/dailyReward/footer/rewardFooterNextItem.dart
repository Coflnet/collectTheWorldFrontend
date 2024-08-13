import 'dart:io';

import 'package:camera/camera.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:flutter/material.dart';

class RewardFooterNextItem extends StatefulWidget {
  const RewardFooterNextItem({Key? key}) : super(key: key);

  @override
  _RewardFooterNextItemState createState() => _RewardFooterNextItemState();
}

class _RewardFooterNextItemState extends State<RewardFooterNextItem> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 238, 226, 255),
              boxShadow: const [
                BoxShadow(
                    spreadRadius: -5,
                    color: Colors.black38,
                    offset: Offset(10, 10),
                    blurRadius: 40)
              ]),
          child: IconButton(
              onPressed: () => changeScene(context),
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 40,
                color: Colors.black,
              )),
        ),
      ],
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

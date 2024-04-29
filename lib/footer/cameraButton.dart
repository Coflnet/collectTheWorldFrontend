import 'dart:io';

import 'package:camera/camera.dart';
import 'package:collect_the_world/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class CameraButton extends StatefulWidget {
  @override
  CameraButtonState createState() => CameraButtonState();
}

class CameraButtonState extends State<CameraButton> {
  late CameraController _controller;
  late var cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    print("trying to load");
    if (Platform.isAndroid || Platform.isIOS){
      print("loading");
      cameras = await availableCameras();
      _controller = CameraController(cameras.first, ResolutionPreset.high);
      await _controller.initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 207, 207, 207).withOpacity(0.04),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                  color: const Color.fromARGB(43, 255, 255, 255), width: 0.7),
            ),
            child: IconButton(
              iconSize: 35,
              onPressed: () {
                loadCameraScene();
              },
              icon: const Icon(Icons.camera_alt_rounded),
              color: const Color.fromRGBO(110, 137, 164, 1), // Icon color
            ),
          ),
        ),
      ),
    );
  }

  void loadCameraScene() async {
    await _initializeCamera();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraScene(controller: _controller)));
  }
}

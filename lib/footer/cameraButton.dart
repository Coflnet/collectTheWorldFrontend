import 'dart:io';

import 'package:camera/camera.dart';
import 'package:collect_the_world/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:hexcolor/hexcolor.dart';

class CameraButtonFooter extends StatefulWidget {
  const CameraButtonFooter({super.key});

  @override
  CameraButtonState createState() => CameraButtonState();
}

class CameraButtonState extends State<CameraButtonFooter> {
  late CameraController _controller;
  late var cameras;

  @override
  void initState() {
    super.initState();
  }

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
        decoration: BoxDecoration(
            color: HexColor("4A4EBA"),
            borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.fromLTRB(0, 10, 5, 17),
        padding: const EdgeInsets.all(4),
        child: IconButton(
          alignment: Alignment.bottomCenter,
          iconSize: 45,
          onPressed: () {
            loadCameraScene();
          },
          icon: const Icon(Icons.camera_alt_outlined),
          color: HexColor("#BDBACC"), // Icon color
        ));
  }

  void loadCameraScene() async {
    await _initializeCamera();
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CameraScene(controller: _controller),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
          transitionDuration: const Duration(milliseconds: 0),
        ));
  }
}

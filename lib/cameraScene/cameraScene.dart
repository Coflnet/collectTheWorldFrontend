import 'dart:io';
import "package:collect_the_world/globals.dart" as globals;

import 'package:camera/camera.dart';
import 'package:collect_the_world/main.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  final CameraController controller;

  const CameraScreen(this.controller);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: CameraPreview(widget.controller),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: _captureImage,
      ),
    );
  }

  Future<void> _captureImage() async {
    try {
      widget.controller.setFlashMode(FlashMode.off);
      final image = await widget.controller.takePicture();
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/captured_image.jpg';
      await image.saveTo(imagePath);
      setState(() {
        globals.image = File(imagePath);
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => confirmScene()));
    } catch (e) {
      print(e);
    }
  }
}

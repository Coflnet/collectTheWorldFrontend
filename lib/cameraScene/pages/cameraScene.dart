import 'dart:io';
import 'package:collect_the_world/cameraScene/pages/finalConformation.dart';
import "package:collect_the_world/globals.dart" as globals;

import 'package:camera/camera.dart';
import 'package:collect_the_world/main.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class CameraScreen extends StatefulWidget {
  final CameraController controller;
  final bool dailyWeeklyItem;
  final String itemName;


  const CameraScreen({required this.controller, this.dailyWeeklyItem = false, this.itemName = ""});

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
      final directory = await getTemporaryDirectory();
      String filePath = '${directory.path}/captured_image.jpg';

      widget.controller.setFlashMode(FlashMode.off);
      final image = await widget.controller.takePicture();
      if (File(filePath).existsSync()) {
        File(filePath).deleteSync();
      }
      final imagePath = filePath;
      await image.saveTo(imagePath);
      setState(() {
        globals.image = File(imagePath);
      });
      if (widget.dailyWeeklyItem) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FinalConformationScene(itemName: widget.itemName)));
        return;
      }

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ConfirmScene()));
    } catch (e) {
      print(e);
    }
  }
}

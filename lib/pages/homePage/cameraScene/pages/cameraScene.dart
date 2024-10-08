import 'dart:io';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/finalConformation.dart';
import "package:collect_the_world/globals/globalScripts/globals.dart"
    as globals;

import 'package:camera/camera.dart';
import 'package:collect_the_world/main.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  final CameraController controller;
  final bool dailyWeeklyItem;
  final String itemName;
  final bool isItemToFind;

  const CameraScreen(
      {required this.controller,
      this.dailyWeeklyItem = false,
      this.itemName = "",
      this.isItemToFind = false});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool capturing = false;

  @override
  void initState() {
    super.initState();
    capturing = false;
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(21, 31, 51, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(21, 31, 51, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: const Color.fromRGBO(21, 31, 51, 1),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Colors.black,
          )),
          CameraPreview(widget.controller)
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 55),
        child: TextButton(
          onPressed: _captureImage,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey.shade300, width: 3),
                borderRadius: BorderRadius.circular(120)),
            child: capturing
                ? LoadingAnimationWidget.inkDrop(
                    color: Colors.grey[300]!, size: 55)
                : Icon(Icons.camera, color: Colors.grey[300], size: 70),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<void> _captureImage() async {
    setState(() {
      capturing = true;
    });
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
        globals.timesTaken++;
        globals.image = File(imagePath);
      });
      if (widget.dailyWeeklyItem) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FinalConformationScene(
                      itemName: widget.itemName,
                      isDailyWeekly: true,
                    )));
        return;
      }

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConfirmScene(
                    isItemToFind: widget.isItemToFind,
                  )));
    } catch (e) {
      print(e);
    }
  }
}

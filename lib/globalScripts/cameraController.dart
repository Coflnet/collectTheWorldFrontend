import 'dart:io';

import 'package:camera/camera.dart';

var controller;

void initCamera() async {
  if (Platform.isAndroid || Platform.isIOS) {
    var cameras = await availableCameras();
    var controller = CameraController(cameras.first, ResolutionPreset.high);
    await controller.initialize();
  }
}

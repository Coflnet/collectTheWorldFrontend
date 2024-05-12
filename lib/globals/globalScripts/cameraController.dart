import 'dart:io';

import 'package:camera/camera.dart';

var controller;

Future<CameraController?> initCamera() async {
  if (Platform.isAndroid || Platform.isIOS) {
    var cameras = await availableCameras();
    controller = CameraController(cameras.first, ResolutionPreset.high);
    await controller.initialize();
    controller = controller;
    return controller;
  }
  return null;
}

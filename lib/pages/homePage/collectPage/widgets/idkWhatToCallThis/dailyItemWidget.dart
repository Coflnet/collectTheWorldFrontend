import 'dart:io';

import 'package:camera/camera.dart';
import 'package:collect_the_world/globals/extentions/extentions.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/numberWidgetContainer.dart';
import 'package:flutter/material.dart';

class DailyItemWidget extends StatefulWidget {
  final String name;
  final int xp;
  final int index;

  const DailyItemWidget(
      {super.key, required this.name, this.xp = 25, required this.index});

  @override
  DailyItemWidgetState createState() => DailyItemWidgetState();
}

class DailyItemWidgetState extends State<DailyItemWidget> {
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
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0)),
        onPressed: () {
          changeScene(context);
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 45,
                        child: Center(
                          child: Text(
                            "${widget.index + 1}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.check_box_outline_blank,
                        size: 42,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.name.capitalize(),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 243, 247),
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      NumberWidgetContainer(xpCount: widget.xp)
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(98, 99, 112, 0.356),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              width: 380,
              height: 2,
            )
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

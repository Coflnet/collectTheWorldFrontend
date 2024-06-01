import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:collect_the_world/globals/extentions/extentions.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/numberWidgetContainer.dart';
import 'package:collect_the_world/pages/profilePage/widgets/profileImageWidget.dart';
import 'package:flutter/material.dart';

class NewestItemWidget extends StatefulWidget {
  final String name;
  final int xp;
  final int index;

  const NewestItemWidget(
      {super.key, required this.name, this.xp = 25, required this.index});

  @override
  NewestItemWidgetState createState() => NewestItemWidgetState();
}

class NewestItemWidgetState extends State<NewestItemWidget> {
  late CameraController _controller;
  late List<CameraDescription> cameras;

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
      margin: const EdgeInsets.fromLTRB(10, 0, 24, 24),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)),
        onPressed: () {
          changeScene(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 35,
                        child: Center(
                          child: Text(
                            "${widget.index + 1}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      ItemNameWidget(name: widget.name),
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Found by",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Tentamens',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      NumberWidgetContainer(xpCount: widget.xp)
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(98, 99, 112, 0.356),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
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

class ItemNameWidget extends StatelessWidget {
  final String name;
  const ItemNameWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: 90,
        child: AutoSizeText(
          name.capitalize(),
          style: const TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w800),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Colors.orangeAccent),
        child: Container(
            margin: const EdgeInsets.all(6),
            child: const Icon(
              Icons.person,
              color: Colors.white70,
              size: 14,
            )));
  }
}

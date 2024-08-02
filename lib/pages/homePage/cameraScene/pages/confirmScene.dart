import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/main.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/confirmButton.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/imageWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/searchBar.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/finalConformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class ConfirmSceneMain extends StatefulWidget {
  final bool isItemToFind;

  const ConfirmSceneMain({super.key, this.isItemToFind = false});

  @override
  _ConfirmSceneMainState createState() => _ConfirmSceneMainState();
}

class _ConfirmSceneMainState extends State<ConfirmSceneMain> {
  String searchBarContent = '';

  void updateSearchBarContent(String content) {
    setState(() {
      searchBarContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: const Color.fromRGBO(21, 31, 51, 1),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 30),
                            const ImageWidget(),
                            ConfirmPageSearchBar(
                                onSearchContentChanged: updateSearchBarContent),
                            ConfirmButton(
                              searchBarContent: searchBarContent,
                              isHttpRequest: false,
                              isItemToFind: widget.isItemToFind,
                            ),
                          ],
                        ),
                        const BackButtonConfirm()
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BackButtonConfirm extends StatefulWidget {
  const BackButtonConfirm({super.key});

  @override
  BackButtonConfirmState createState() => BackButtonConfirmState();
}

class BackButtonConfirmState extends State<BackButtonConfirm> {
  late CameraController _controller;
  late var cameras;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          loadCameraScene();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(12, 38, 0, 0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(61, 49, 102, 1),
              borderRadius: BorderRadius.circular(120)),
          child: Icon(
            Icons.arrow_back_rounded,
            color: HexColor("#F7B0FF"),
            size: 40,
          ),
        ));
  }

  Future<void> _initializeCamera() async {
    if (Platform.isAndroid || Platform.isIOS) {
      cameras = await availableCameras();
      _controller = CameraController(cameras.first, ResolutionPreset.high);
      await _controller.initialize();
    }
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

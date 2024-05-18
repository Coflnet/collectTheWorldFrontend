import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:collect_the_world/main.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:http/http.dart' as http;
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;

String url = "http://10.0.0.19:6969";

class SlidingBox extends StatelessWidget {
  final String name;

  const SlidingBox({
    super.key,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ContainerListView(),
      ),
    );
  }
}

class ContainerListView extends StatefulWidget {
  final bool isVisible;
  final double margin;
  final double iconSize;
  const ContainerListView(
      {super.key, this.margin = 10, this.isVisible = true, this.iconSize = 30});

  @override
  _ContainerListViewState createState() => _ContainerListViewState();
}

class _ContainerListViewState extends State<ContainerListView> {
  final List items = [];

  @override
  void initState() {
    print("init");
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
          controller: ScrollController(initialScrollOffset: 0),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return NewItemWidget(
              name: items[index]["name"],
              iconSize: widget.iconSize,
              margin: widget.margin,
              isVisible: widget.isVisible,
              xp: items[index]["xp"],
            );
          }),
    ]);
  }

  void getItems() async {
    requestItems();

    // final response = await http.get(Uri.parse("$url/ctw/daily"));
    // if (response.statusCode == 200) {
    //   var result = jsonDecode(response.body);
    //   setState(() {
    //     items.addAll(result["items"].take(5));
    //   });
    // }
  }

  Future<String?> requestItems() async {
    print("lkjhlkajdljasd\nlkjhlkajdljasd\nlkjhlkajdljasd\n");
    var token = (await authclie.Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = ObjectApi(client);

    var result = await apiInstance.getChellenge();

    Set<dynamic> newList = {};

    for (var i in result!) {
      newList.add({"name": i.name, "xp": i.value});
    }
    setState(() {
      items.addAll(newList);
    });
  }
}

class NewItemWidget extends StatefulWidget {
  final String name;
  final int xp;
  final bool isVisible;
  final double margin;
  final double iconSize;

  const NewItemWidget(
      {required this.name,
      this.iconSize = 30,
      this.margin = 8,
      this.isVisible = true,
      this.xp = 25});

  @override
  NewItemWidgetState createState() => NewItemWidgetState();
}

class NewItemWidgetState extends State<NewItemWidget> {
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
      margin: const EdgeInsets.fromLTRB(13, 8, 13, 8),
      decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(color: Colors.white12),
          borderRadius: BorderRadius.circular(15)),
      child: TextButton(
        onPressed: () {
          changeScene(context);
        },
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Icon(
                      Icons.check_box_outline_blank,
                      size: widget.iconSize,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    // Wrap the Text widget with Expanded
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
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
            builder: (context) =>
                CameraScreen(controller: _controller, dailyWeeklyItem: true, itemName: widget.name,)));
  }
}

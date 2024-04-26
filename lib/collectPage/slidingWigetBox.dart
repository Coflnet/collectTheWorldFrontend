import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url = "http://localhost:6969";

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
  @override
  _ContainerListViewState createState() => _ContainerListViewState();
}

class _ContainerListViewState extends State<ContainerListView> {
  final List items = [];

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return itemWidget(name: items[index]);
          }),
      

    ]);
  }

  void getItems() async {
    final response = await http.get(Uri.parse("$url/ctw/daily"));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      setState(() {
        items.addAll(result["items"]);
      });
    }
  }
}

class itemWidget extends StatelessWidget {
  final String name;
  final int xp = 25;

  const itemWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.5, color: const Color.fromARGB(61, 247, 247, 247)),
          borderRadius: BorderRadius.circular(15)),
      height: 85,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.05),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  const Icon(Icons.check_box_outline_blank_rounded,
                      color: Colors.white,
                      size: 50,
                      shadows: [
                        Shadow(
                            blurRadius: 6,
                            color: Color.fromARGB(155, 255, 255, 255),
                            offset: Offset(0.5, 3))
                      ]),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(name,
                      style: const TextStyle(color: Colors.white, shadows: [
                        Shadow(
                            blurRadius: 8,
                            color: Color.fromARGB(155, 255, 255, 255),
                            offset: Offset(0, 6))
                      ]),
                      textScaler: const TextScaler.linear(1.3)),
                ]),
                Text(
                  "+$xp",
                  style: const TextStyle(color: Colors.white, shadows: [
                    Shadow(
                        blurRadius: 8,
                        color: Color.fromARGB(155, 255, 255, 255),
                        offset: Offset(0, 6))
                  ]),
                  textScaler: const TextScaler.linear(1.7),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

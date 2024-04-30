import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:http/http.dart' as http;

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
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return NewItemWidget(
                name: items[index],
                iconSize: widget.iconSize,
                margin: widget.margin,
                isVisible: widget.isVisible);
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

class NewItemWidget extends StatelessWidget {
  final String name;
  final int xp;
  final bool isVisible;
  final double margin;
  final double iconSize;

  const NewItemWidget(
      {required this.name,
      this.iconSize = 30,
      this.margin = 10,
      this.isVisible = true,
      this.xp = 25});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: GlassContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.check_box_outline_blank, size: iconSize),
              color: Colors.white,
            ),
            Expanded(
              // Wrap the Text widget with Expanded
              child: Text(
                name,
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
    );
  }
}

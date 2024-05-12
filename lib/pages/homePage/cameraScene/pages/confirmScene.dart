import 'dart:ui';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/confirmButton.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/imageWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/searchBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          ConfirmPageSearchBar(onSearchContentChanged: updateSearchBarContent),
          const ImageWidget(),
        ConfirmButton(searchBarContent: searchBarContent, isHttpRequest: false, isItemToFind: widget.isItemToFind,),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

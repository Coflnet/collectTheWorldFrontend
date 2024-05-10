import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/cameraScene/confirm/searchBar.dart';
import 'package:collect_the_world/cameraScene/confirm/widgets/confirmButton.dart';
import 'package:collect_the_world/cameraScene/confirm/widgets/imageWidget.dart';
import 'package:flutter/material.dart';

class DescriptionScene extends StatefulWidget {
  final String searchBarContents;

  const DescriptionScene({Key? key, required this.searchBarContents});


  @override
  DescriptionSceneState createState() => DescriptionSceneState();
}

class DescriptionSceneState extends State<DescriptionScene> {
  String searchBarContent = '';

  void updateSearchBarContent(String content) {
    setState(() {
      searchBarContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        body: Stack(
          children: [
            const BackgroundGradiant(),
            Column(
              children: [
                ConfirmPageSearchBar(
                  onSearchContentChanged: updateSearchBarContent,
                  isDescrip: true,
                ),
                const ImageWidget(),
                const Text(
                  textAlign: TextAlign.center,
                  "Describe the image\nGain double XP",
                  style: TextStyle(color: Colors.white, fontSize: 28, ),
                ),
                ConfirmButton(searchBarContent: widget.searchBarContents, isHttpRequest: true)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

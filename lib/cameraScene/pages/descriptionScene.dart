import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/cameraScene/confirm/searchBar.dart';
import 'package:collect_the_world/cameraScene/confirm/widgets/imageWidget.dart';
import 'package:flutter/material.dart';

class DescriptionScene extends StatefulWidget {
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
      home: Scaffold(
        body: Stack(
          children: [
            const BackgroundGradiant(),
            Column(
              children: [
                
                ConfirmPageSearchBar(
                    onSearchContentChanged: updateSearchBarContent, isDescrip: true,),
                const ImageWidget(),
                Text("describe the image and \n gain three times the XP", style: TextStyle(color: Colors.white, fontSize: 30),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/searchBar.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/confirmButton.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/imageWidget.dart';
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
        home: Scaffold(body: LayoutBuilder(builder: (context, constraints) {
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
                            children: [
                              const BackgroundGradiant(),
                              Column(
                                children: [
                                  const SizedBox(height: 48),
                                  ConfirmPageSearchBar(
                                    onSearchContentChanged:
                                        updateSearchBarContent,
                                    isDescrip: true,
                                  ),
                                  const SizedBox(height: 18),
                                  const Text(
                                    textAlign: TextAlign.center,
                                    "Describe the image\nGain double XP",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                    ),
                                  ),
                                  const ImageWidget(sideMargin: 60),
                                  ConfirmButton(
                                      searchBarContent:
                                          widget.searchBarContents,
                                      isHttpRequest: true)
                                ],
                              ),
                            ],
                          )))));
        })));
  }
}

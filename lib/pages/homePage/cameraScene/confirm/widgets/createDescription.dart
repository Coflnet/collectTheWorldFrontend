import 'package:collect_the_world/pages/homePage/cameraScene/pages/descriptionScene.dart';
import 'package:flutter/material.dart';

class CreateDescription extends StatelessWidget {
  final String searchBarContent;

  const CreateDescription({super.key, required this.searchBarContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 45, 15, 0),
      decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white12, width: 1.5)),
      child: Stack(alignment: AlignmentDirectional.topEnd, children: [
        TextButton(
            onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DescriptionScene(
                                searchBarContents: searchBarContent,
                              )))
                },
            child: const Row(
              children: [
                Text(
                  "Add description",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 15),
                ),
                Icon(
                  Icons.add_rounded,
                  color: Colors.orangeAccent,
                  size: 45,
                )
              ],
            )),
      ]),
    );
  }
}

import 'package:collect_the_world/pages/homePage/cameraScene/pages/descriptionScene.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CreateDescription extends StatelessWidget {
  final String searchBarContent;

  const CreateDescription({super.key, required this.searchBarContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 45, 15, 0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(62, 52, 99, 1),
        borderRadius: BorderRadius.circular(20),
      ),
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
            child: Row(
              children: [
                Text(
                  "Add description",
                  style: TextStyle(color: HexColor("#F7B0FF"), fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Icon(
                  Icons.add_rounded,
                  color: HexColor("#F7B0FF"),
                  size: 45,
                )
              ],
            )),
      ]),
    );
  }
}

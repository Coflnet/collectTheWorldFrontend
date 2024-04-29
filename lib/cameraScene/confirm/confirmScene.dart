import 'dart:ui';
import 'package:collect_the_world/cameraScene/confirm/searchBar.dart';
import 'package:collect_the_world/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class confirmSceneMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          searchBar(),
          Container(
            margin: const EdgeInsets.fromLTRB(70, 40, 70, 25),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.white24,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: globals.image == null
                  ? Container() // Placeholder widget if no image is selected
                  : Image.file(
                      globals.image!,
                      fit: BoxFit.cover, // Cover the whole area
                    ),
            ),
          ),
          confirmButton(),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

class confirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: 83,
              height: 83,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 207, 207, 207).withOpacity(0.04),
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                    color: const Color.fromARGB(43, 255, 255, 255), width: 0.7),
              ),
              child: IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.check_rounded,
                    color: Colors.orange,
                    size: 60,
                  )),
            ),
          ),
        ));
  }
}

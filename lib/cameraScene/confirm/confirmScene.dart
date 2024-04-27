
import 'package:collect_the_world/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class confirmSceneMain extends StatelessWidget {
  final image;

  confirmSceneMain({required this.image})

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(image: FileImage(globals.image!))
      ],
    );
  }
}


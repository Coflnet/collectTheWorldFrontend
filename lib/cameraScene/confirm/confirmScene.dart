import 'dart:ui';
import 'package:collect_the_world/cameraScene/confirm/confirmButton.dart';
import 'package:collect_the_world/cameraScene/confirm/imageWidget.dart';
import 'package:collect_the_world/cameraScene/confirm/searchBar.dart';
import 'package:collect_the_world/cameraScene/finalConformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmSceneMain extends StatelessWidget {
  const ConfirmSceneMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ConfirmPageSearchBar(),
          const ImageWidget(),
          const ConfirmButton(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}


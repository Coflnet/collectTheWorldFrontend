import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/collectPage/header.dart';

void main() {
  runApp(const homePage());
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(39, 60, 87, 1),
        floatingActionButton: cameraButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Footer(),
      ),
    );
  }
}

class CapturePage extends StatelessWidget {
  const CapturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [header()],
        ),
        floatingActionButton: const cameraButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: const Color.fromRGBO(39, 60, 87, 1),
        bottomNavigationBar: const Footer(),
      ),
    );
  }
}

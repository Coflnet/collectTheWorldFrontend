import 'package:flutter/material.dart';

class BackgroundGradiant extends StatelessWidget {
  const BackgroundGradiant({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(39, 45, 58, 1),
        Color.fromRGBO(28, 29, 39, 1),
      ],
    )));
  }
}

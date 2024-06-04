import 'package:flutter/material.dart';

class LBxpWidget extends StatelessWidget {
  final int xp;
  const LBxpWidget({super.key, required this.xp});

  @override
  Widget build(BuildContext context) {
    return Text("$xp", );
  }
}

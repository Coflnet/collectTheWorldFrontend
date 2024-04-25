import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class SlidingBox extends StatelessWidget {
  final String name;

  const SlidingBox({super.key, required this.name,});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(child: Text("page $name"),),
    );
  }
}
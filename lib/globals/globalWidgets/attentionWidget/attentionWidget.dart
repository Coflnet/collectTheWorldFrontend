import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AttentionWidget extends StatelessWidget {
  final Widget child;

  const AttentionWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              HexColor("2A2C5A"),
              HexColor("2A2C5A"),
            ],
          )),
      child: child,
    );
  }
}

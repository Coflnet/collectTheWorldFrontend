import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(29, 170, 180, 1),
              Color.fromRGBO(24, 127, 136, 1),
            ],
          )),
      child: child,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class baseWidget extends StatelessWidget {
  final Widget child;

  const baseWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(64, 56, 105, 1),
              Color.fromRGBO(62, 52, 99, 1),
            ],
          )),
      child: child,
    );
  }
}

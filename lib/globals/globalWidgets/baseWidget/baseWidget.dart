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
              Color.fromRGBO(73, 61, 91, 1),
              Color.fromRGBO(61, 64, 91, 1),
              
            ],
          )),
      child: child,
    );
  }
}

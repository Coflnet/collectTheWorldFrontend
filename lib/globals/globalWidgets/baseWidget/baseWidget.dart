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
          border: Border.all(color: Colors.white24, width: 2),
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(76, 76, 104, 1),
              Color.fromRGBO(53, 54, 75, 1),
            ],
          )),
      child: child,
    );
  }
}

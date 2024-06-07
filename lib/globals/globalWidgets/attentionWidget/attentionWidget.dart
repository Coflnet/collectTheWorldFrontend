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
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(105, 69, 135, 1),
              Color.fromRGBO(105, 69, 135, 1),
            ],
          )),
      child: child,
    );
  }
}

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
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromRGBO(112, 48, 172, 1),
              Color.fromRGBO(112, 48, 172, 1),
              Color.fromRGBO(99, 40, 154, 1),
            ],
          )),
      child: child,
    );
  }
}

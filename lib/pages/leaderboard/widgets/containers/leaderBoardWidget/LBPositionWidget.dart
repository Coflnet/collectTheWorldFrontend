import 'package:flutter/material.dart';

class LBPositionWidget extends StatelessWidget {
  final int index;
  const LBPositionWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Center(
        child: Text(
          "${index + 1}",
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';


class FrostedGlass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: ClipRect(
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.00))),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

class header extends StatelessWidget {
  const header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [const headerBackButton(), headerSearchButton()],
      ),
    );
  }
}

class headerSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.05),
              border: Border.all(color: Colors.white12, width: 1.5, ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
                iconSize: 40,
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}

class headerBackButton extends StatelessWidget {
  const headerBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () {},
          child: const Text(
            style: TextStyle(color: Colors.white),
            "< object list",
            textScaler: TextScaler.linear(2.8),
          )),
    );
  }
}

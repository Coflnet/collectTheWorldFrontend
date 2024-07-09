import 'package:flutter/material.dart';

class LegalOptionsButton extends StatelessWidget {
  final VoidCallback moreOptions;

  const LegalOptionsButton({super.key, required this.moreOptions});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: TextButton(
          onPressed: moreOptions,
          child: const Text(
            "More Options",
            style: TextStyle(
                color: Colors.white54,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}

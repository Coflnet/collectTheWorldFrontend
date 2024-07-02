import 'package:flutter/material.dart';

class RewardVariationButton extends StatelessWidget {
  final VoidCallback disapear;
  const RewardVariationButton({super.key, required this.disapear});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(119, 80, 119, 1),
              borderRadius: BorderRadius.circular(8)),
          child: TextButton(
            onPressed: disapear,
            child: const Text("Confirm",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24)),
          ),
        ),
      ],
    );
  }
}
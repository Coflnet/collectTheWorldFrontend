import 'package:flutter/material.dart';

class LegalVariationButton extends StatelessWidget {
  final VoidCallback disapear;
  final String buttonText;
const LegalVariationButton({ super.key, required this.disapear, required this.buttonText });

  @override
  Widget build(BuildContext context){
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(119, 80, 119, 1),
              borderRadius: BorderRadius.circular(8)),
          child: TextButton(
            onPressed: disapear,
            child: Text(buttonText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24)),
          ),
        );
  }
}
import 'package:flutter/material.dart';

class CreateDescription extends StatelessWidget {
  const CreateDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0,40,15,0),
      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(20)),
      child: TextButton(
          onPressed: () => {},
          child: const Row(
            children: [
              Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 45,
              )
            ],
          )),
    );
  }
}

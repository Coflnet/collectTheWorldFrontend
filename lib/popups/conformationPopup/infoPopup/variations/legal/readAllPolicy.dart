import 'package:flutter/material.dart';

class ReadAllPolicy extends StatelessWidget {
  final bool isDone;
  const ReadAllPolicy({super.key, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("I read all the policy ", style: TextStyle(color: Colors.grey[400], fontSize: 17),),
        isDone
            ? Icon(
                Icons.check_box_outlined,
                size: 25,
                color: Colors.green[200],
              )
            : Icon(
                Icons.check_box_outline_blank,
                size: 25,
                color : Colors.grey[400]
              )
      ],
    );
  }
}

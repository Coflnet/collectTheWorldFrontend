import 'package:flutter/material.dart';

class NewestItemFoundBy extends StatelessWidget {
  const NewestItemFoundBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          const Text(
            "Found by",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
          ),
          Text(
            'N/A',
            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 15),
          )
        ],
      ),
    );
  }
}

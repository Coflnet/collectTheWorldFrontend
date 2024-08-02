import 'package:flutter/material.dart';

class RecentPicturesSliding extends StatelessWidget {
  const RecentPicturesSliding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(color: Colors.black, width: 80, height: 20),
          Container(color: Colors.white, width: 80, height: 20),
          Container(color: Colors.black, width: 80, height: 20),
          Container(color: Colors.white, width: 80, height: 20),
          Container(color: Colors.black, width: 80, height: 20),
          Container(color: Colors.white, width: 80, height: 20),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppleSigninOption extends StatelessWidget {
  const AppleSigninOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 44,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.apple, color: Colors.black, size: 30),
                SizedBox(width: 5),
                Text("Sign-in with Apple",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

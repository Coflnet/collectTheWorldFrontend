import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';

class GoogleSigninOption extends StatelessWidget {
  const GoogleSigninOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: redirectToGoogleStuff,
          child: Container(
            width: 250,
            height: 44,
            padding: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3)),
                  child: Image.network(
                      height: 34,
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      fit: BoxFit.cover),
                ),
                const SizedBox(width: 5.0),
                const Text(
                  'Sign-in with Google',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void redirectToGoogleStuff() async {
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];

    GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId:
          "11977394787-sj5nb9ajsk13ud0osrbv49umiedjak6b.apps.googleusercontent.com",
      scopes: scopes,
    );
    try {
      await _googleSignIn.signIn();
    } catch (e) {
      print("error signing in with google $e");
    }
  }
}

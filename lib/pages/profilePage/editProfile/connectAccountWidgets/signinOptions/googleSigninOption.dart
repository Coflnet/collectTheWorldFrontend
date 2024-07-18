import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/accountDeletionHandler.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';

class GoogleSigninOption extends StatelessWidget {
  final VoidCallback callback;
  const GoogleSigninOption({super.key, required this.callback});

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
      scopes: scopes,
    );
    try {
      final result = await _googleSignIn.signIn();
      final auth = await result?.authentication;
      if (auth == null) {
        return;
      }
      updateData(auth.accessToken ?? "");
    } catch (e) {
      print("error signing in with google $e");
    }
  }

  void updateData(String tokenSet) async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);

    final apiInstance = AuthApi(client);
    try {
      final result = await apiInstance.connectGoogle(
          authToken: AuthToken(token: tokenSet));
      callback();
    } catch (e) {
      ProfileRetrevial().setIsConnected(true);
      callback();
      print("error connecting google account $e");
    }
  }
}

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/editProfileHeader.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/editUsernameProfile.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/generateNewProfilePic.dart';
import 'package:collect_the_world/pages/profilePage/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:random_string/random_string.dart';

class EditProfileMain extends StatefulWidget {
  const EditProfileMain({super.key});

  @override
  _EditProfileMainState createState() => _EditProfileMainState();
}

class _EditProfileMainState extends State<EditProfileMain> {
  String profileString = ProfileRetrevial().getProfileString();
  String username = ProfileRetrevial().getUsername();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EditProfileHeader(saveCallBack: saveProfileInfo),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[RandomAvatar(profileString, width: 120)],
            ),
            const SizedBox(height: 8),
            GenerateNewProfilePic(generate: generateCallBack),
            EditUsernameProfile(
              usernameChange: changeUsername,
            )
          ],
        ),
        backgroundColor: const Color.fromRGBO(21, 31, 51, 1),
      ),
    );
  }

  void saveProfileInfo() async {
    print(username);
    ProfileRetrevial().setProfileString(profileString);
    ProfileRetrevial().setUsername(username);
    LoadingProfileInfo().saveFile();

    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = LeaderboardApi(client);
    try {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProfilePage()));
      apiInstance.setProfile(
          publicProfile: PublicProfile(name: username, avatar: profileString));
    } catch (e) {
      print("error setting profile data $e");
    }
  }

  void generateCallBack() {
    setState(() {
      profileString = randomString(randomBetween(5, 15));
    });
  }

  void changeUsername(String newString) {
    print(newString);
    setState(() {
      username = newString;
    });
  }
}

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/legalChangeUploader.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/connectAccountWidgets/connectAccountMain.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/editLegalProfileWidgets/editProfilePrivacy.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/editProfileHeader.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/editProfileWidgets/deleteProfilePopup.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/editProfileWidgets/deleteProfileWidget.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/editProfileWidgets/editProfileNotifications.dart';
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
  bool privacyChanges = false;
  bool deletePopup = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      home: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
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
                  ),
                  const EditProfileNotifications(),
                  const EditProfilePrivacy(),
                  DeleteProfileWidget(callBack: deleteAccountCallBack)
                ],
              ),
            ),
            Visibility(
                visible: deletePopup,
                child: DeleteProfilePopup(close: closePopup)),
            EditProfileHeader(saveCallBack: saveProfileInfo),
          ],
        ),
        backgroundColor: const Color.fromRGBO(21, 31, 51, 1),
      ),
    );
  }

  void closePopup() {
    setState(() {
      deletePopup = false;
    });
  }

  void deleteAccountCallBack() {
    setState(() {
      deletePopup = true;
    });
  }

  void saveProfileInfo() async {
    ProfileRetrevial().setProfileString(profileString);
    ProfileRetrevial().setUsername(username);
    LegalChangeUploader().submiteChanges();

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

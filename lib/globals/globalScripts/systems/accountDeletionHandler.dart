import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/globals/globalScripts/systems/legalChangeUploader.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';

class accountDeletionHandler {
  Future<void> deleteFrontEndData() async {
    ProfileRetrevial().setSkips(0);
    ProfileRetrevial().setStreak(0);
    ProfileRetrevial().setTotalXp(0);
    ProfileRetrevial().setTotal(0);
    ProfileRetrevial().setUnqiue(0);
    ProfileRetrevial().setProfileString("");
    ProfileRetrevial().setTopThree(0);
    ProfileRetrevial().setUsername("");
    LoadingProfileInfo().saveFile();
    Authclient().deleteAccount();
    ItemToFindHandler().deleteAccount();
    LegalChangeUploader().deleteAccount();
  }
}

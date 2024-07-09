import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';

ConsentData optionsChosen = ConsentData();

class LegalChangeUploader {
  set userId(String? value) => optionsChosen.userId = value;
  set givenAt(DateTime? value) => optionsChosen.givenAt = value;
  set targetedAds(bool? value) => optionsChosen.targetedAds = value;
  set tracking(bool? value) => optionsChosen.tracking = value;
  set analytics(bool? value) => optionsChosen.analytics = value;
  set allowResell(bool? value) => optionsChosen.allowResell = value;
  set newService(bool? value) => optionsChosen.newService = value;

  void makeChange(int whichOne, value) {
    switch (whichOne) {
      case 1:
        optionsChosen.givenAt = value;
      case 2:
        optionsChosen.targetedAds = value;
      case 3:
        optionsChosen.tracking = value;
      case 4:
        optionsChosen.analytics = value;
      case 5:
        optionsChosen.allowResell = value;
      case 6:
        optionsChosen.newService = value;
    }
  }

  void submiteChanges() async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);

    final api_instance = PrivacyApi(client);
    optionsChosen.givenAt = DateTime.now();
    try {
      final result = await api_instance.saveConsent(consentData: optionsChosen);
      print(result);
    } catch (e) {
      print("there was an error uploading the privacy changes $e");
    }
  }
}

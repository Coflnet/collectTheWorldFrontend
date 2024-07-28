import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';

class GalleryImageRequesting {
  void requestImage(String id) async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = ImageApi(client);

    try {
      var result = apiInstance.getImage(id);
    } catch (e) {
      print("error requesting image download url $e");
    }
  }
}

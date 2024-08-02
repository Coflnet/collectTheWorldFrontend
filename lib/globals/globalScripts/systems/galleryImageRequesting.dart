import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:dio/dio.dart';

class GalleryImageRequesting {
   Future requestImage(String id) async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = ImageApi(client);

    try {
      var result = await apiInstance.getImage(id);
      Dio dio = Dio();
      String url = result?.downloadUrl ?? "";
      Response response = await dio.get(url,
          options: Options(responseType: ResponseType.bytes));
      return response.data;
    } catch (e) {
      print("error requesting image download url $e");
    }
  }
}

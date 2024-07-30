import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:dio/dio.dart';

class GalleryImageRequesting {
  void requestImage(String id) async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = ImageApi(client);

    Dio dio = Dio();
    String url = "https://ctw-data.fd03721f31d7dccb9201acb6d9840d6d.r2.cloudflarestorage.com/ctw-data/fork/585e0c63-46bb-435d-b56f-16b45a90c0d8?AWSAccessKeyId=fee8ad4c64df890f967f030c84dcd933&Expires=1722288580&Signature=wIT43l%2F6dXxeoO172WLmXGw7LUg%3D";
    Response response = await dio.get(url, options: Options(responseType: ResponseType.bytes));
    print(response.data);
    return;
    try {
      var result = await apiInstance.getImage(id);
      print(result);
    } catch (e) {
      print("error requesting image download url $e");
    }
  }
}

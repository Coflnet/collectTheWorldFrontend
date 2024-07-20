import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:collect_the_world/globals/globalScripts/globals.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:random_string_generator/random_string_generator.dart';

List firstFive = [];

class gallerySaving {
  void loadFileDataThumbNail() async {
    return;
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/gallerySavingNail.json";
    File file = File(filePath);
    if (!file.existsSync()) {
      file.createSync();
      var fileData = [];
      var jsonFileData = jsonEncode(fileData);
      await file.writeAsString(jsonFileData);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);
    print(fileData);

    firstFive = fileData.take(1).toList();
    //    return jsonList.sublist(offset, offset + count > jsonList.length ? jsonList.length : offset + count);
  }

  Future<List> laodThumbNails(Int amount, Int offset) async {
    return [];
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/gallerySavingNail.json";
    File file = File(filePath);
    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);

    List returnResult =
        fileData["savedItems"].entries.skip(offset).take(amount).toList();
    return returnResult;
  }

  void savePhoto() async {
    return;
    String imageToken = RandomStringGenerator(fixedLength: 12).generate();
    Uint8List imageBytes = await GlobalVars().getImage.readAsBytes();

    img.Image? image = img.decodeImage(imageBytes);

    if (image == null) {
      throw Exception('Unable to decode image');
    }

    final img.Image resizedImage =
        img.copyResize(image, width: 120, height: 240);
    Uint8List resizedBytes = Uint8List.fromList(img.encodeJpg(resizedImage));
    Directory appDir = await getApplicationDocumentsDirectory();
    File file = File("${appDir.path}/gallerySavingNail.json");
    final jsonString = jsonEncode({"key": imageToken, "image":resizedBytes});
  }
}

class GlobalVars {
  get getImage => null;
}

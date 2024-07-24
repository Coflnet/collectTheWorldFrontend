import 'dart:typed_data';

import 'package:collect_the_world/globals/globalScripts/globals.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class thumbNail {
  final Uint8List imageBytes;
  final String name;

  const thumbNail({
    required this.name,
    required this.imageBytes,
  });
}

late Database db;

class gallerySaving {

  void loadDataBase() async {
    db = await openDatabase(join(await getDatabasesPath(), 'thumbNails.db'),
    onCreate: (dbInst, version){
      return db.execute("CREATE TABLE thumbNails(name STRING, imageBytes Uint8List)");
    });
  }

  void saveImageThumbNail() {
    Uint8List imageBytes = Globals().getImage.readAsBytes();
    img.Image? image = img.decodeImage(imageBytes);

    if (image == null) {
      throw Exception('Unable to decode image');
    }

    img.Image resizedImage = img.copyResize(image, width: 128, height: 240);
    Uint8List resizedBytes =
        Uint8List.fromList(img.encodeJpg(resizedImage, quality: 75));
  }
}

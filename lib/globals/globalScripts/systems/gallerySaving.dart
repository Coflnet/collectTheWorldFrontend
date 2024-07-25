import 'dart:typed_data';

import 'package:collect_the_world/globals/globalScripts/globals.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class thumbNail {
  final Uint8List imageBytes;
  final String name;
  final String created;
  final String id;

  Map<String, Object> toMap() {
    return {
      "imageBytes": imageBytes,
      "name": name,
      "created": created,
      "id": id,
    };
  }

  const thumbNail({
    required this.id,
    required this.created,
    required this.name,
    required this.imageBytes,
  });
}

late Database db;

List first5Thumbnails = [];

class gallerySaving {
  void loadDataBase() async {
    db = await openDatabase(
      join(
        await getDatabasesPath(),
        'thumbNails.db',
      ),
      version: 1,
      onCreate: (dbInst, version) {
        return dbInst.execute(
            "CREATE TABLE thumbNails(name STRING, imageBytes Uint8List, created STRING, id STRING)");
      },
    );

    first5Thumbnails =
        await db.query("thumbNails", orderBy: "created", limit: 5);
    first5Thumbnails = [
      for (final {
            "imageBytes": imageBytes as Uint8List,
            "name": name as String,
            "created": created as String,
            "id": id as String,
          } in first5Thumbnails)
        thumbNail(imageBytes: imageBytes, name: name, created: created, id: id)
    ];
  }

  void saveImageThumbNail() async {
    Uint8List imageBytes = await Globals().getImage.readAsBytes();
    img.Image? image = img.decodeImage(imageBytes);

    if (image == null) {
      throw Exception('Unable to decode image');
    }

    img.Image resizedImage = img.copyResize(image, width: 128, height: 240);
    Uint8List resizedBytes =
        Uint8List.fromList(img.encodeJpg(resizedImage, quality: 75));
    var insertData = thumbNail(
        id: Globals().getImageId,
        created: DateTime.now().toIso8601String(),
        name: Globals().getImageName,
        imageBytes: resizedBytes);
    db.insert("thumbNails", insertData.toMap());
  }
}

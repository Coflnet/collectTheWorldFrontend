import 'dart:io';

File? image;
String imageId = "";
String imageName = "";
int timesTaken = 0;

class Globals {
  get getImage => image;
  get getImageId => imageId;
  get getImageName => imageName;
  set setImage(newValue) => image = newValue;
  set setImageId(newValue) => imageId = newValue;
  set setImageName(newValue) => imageName = newValue;
}

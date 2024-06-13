
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({super.key});
  
  get cam => null;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 14, 12, 0),
            width: 85,
            height: 85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 238, 226, 255),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: -5,
                    color: Colors.black38,
                    offset: Offset(10, 10),
                    blurRadius: 40
                  )
                ]),
            child: IconButton(
                onPressed: () => changeToCameraScene(context),
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 50,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }

  void changeToCameraScene(context) async {
    var newcontoller = await cam.initCamera();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraScreen(
                  controller: newcontoller!,
                  dailyWeeklyItem: true,
                  isItemToFind: true,
                )));
  }
}

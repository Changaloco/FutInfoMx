import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'imagescreen.dart';
import 'camerascreen.dart';
class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreen createState() => _GalleryScreen();
}

class _GalleryScreen extends State<GalleryScreen> {
  List<PickedFile> images = [];
  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuerdos del futbol.'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          File imageFile = File(images[index].path);
          return InkWell(
              child: Image.file(imageFile),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ImageViewScreen(
                          imageFile: imageFile,
                        )));
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _optionsDialogBox,
      ),
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('image_picker: Cámara'),
                    onTap: _openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('image_picker: Galería'),
                    onTap: _openGallery,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('camera: cámara'),
                    onTap: () async {
                      String picturePath = await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => CameraScreen()));
                      Navigator.pop(context);
                      print(picturePath);
                      setState(() {
                        images.add(PickedFile(picturePath));
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  

  void _openCamera() async {
    // ignore: deprecated_member_use
    PickedFile? picture = await imagePicker.getImage(
      source: ImageSource.camera,
    );
    Navigator.pop(context);
    setState(() {
      images.add(picture!);
    });
  }

  void _openGallery() async {
    // ignore: deprecated_member_use
    PickedFile? picture = await imagePicker.getImage(
      source: ImageSource.gallery,
    );
    Navigator.pop(context);
    setState(() {
      images.add(picture!);
    });
  }
}
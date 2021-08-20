import 'package:flutter/material.dart';
import 'profile_header.dart';
import '../../widgets/categorybottombar.dart';
import 'package:image_picker/image_picker.dart';


class PerfilFutbol extends StatefulWidget {
  const PerfilFutbol({Key? key}) : super(key: key);
  @override
  _PerfilFutbol createState() => _PerfilFutbol();
}

class _PerfilFutbol extends State<PerfilFutbol> {
  List<PickedFile> images = [];
  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.purple,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            )),
            child: Stack(children: [
              ProfileHeader(),
              Positioned(
                  bottom: 0, right: 0, left: 0, child: CategoryBottomBar())
            ])),
        );
  }

  


  
}

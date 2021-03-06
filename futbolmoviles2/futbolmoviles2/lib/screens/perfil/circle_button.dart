import 'package:flutter/material.dart';
import '../camera/camerascreen.dart';

// ignore: must_be_immutable
class CircleButton extends StatefulWidget {
  bool mini;
  var icon;
  double iconSize;
  var color;

  CircleButton(this.mini, this.icon, this.iconSize, this.color);

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }
}

class _CircleButton extends State<CircleButton> {
  void onPressedButton() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CameraScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
      backgroundColor: widget.color,
      mini: widget.mini,
      onPressed: onPressedButton,
      child: Icon(
        widget.icon,
        size: widget.iconSize,
        color: Color(0xFF4268D3),
      ),
    ));
  }
}

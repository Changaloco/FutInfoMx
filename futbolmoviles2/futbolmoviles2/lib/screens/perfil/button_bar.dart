import 'package:flutter/material.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1)),  
          ],
        )
    );
  }

}
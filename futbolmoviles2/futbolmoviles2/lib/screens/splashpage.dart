import 'package:flutter/material.dart';
import '../widgets/IconFont.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;
  SplashPage({required this.duration, required this.goToPage});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => goToPage));
    });
    return Scaffold(
        body: Container(
            color: Color(0xFF29B6F6),
            alignment: Alignment.center,
            child: Center(child: IconFont(color: Colors.white, size: 200))));
  }
}

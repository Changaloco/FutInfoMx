import 'package:flutter/material.dart';
import 'screens/splashpage.dart';
import 'screens/welcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/loginservice.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_) => LoginService(), 
      child:MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(duration:4,goToPage: WelcomeScreen())
    )
    );
  }
}








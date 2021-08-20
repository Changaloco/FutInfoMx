import 'package:flutter/material.dart';
import '../../services/futbolservice.dart';
import '../../models/standingmodel.dart';
import 'leaguetable.dart';
class StandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LigaApp(),
    );
  }
  
}

class LigaApp extends StatefulWidget {
  @override
  _LigasAppState createState() => _LigasAppState();
}

class _LigasAppState extends State<LigaApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0.0,
        title: Text(
          "Liga",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),

      body: FutureBuilder(
        future: FutbolService().getPartidos(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            snapshot.data as List<Liga>;
            List<Liga> datos = snapshot.data as List<Liga>;
            print(datos[0].standings.rank);
            return LeagueTable(datos);
          }else{
            return Center(
              child:CircularProgressIndicator()
            );
          }
        }
      )
    );
  }
  
}
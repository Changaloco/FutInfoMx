import 'package:flutter/material.dart';
import '../../services/futbolservice.dart';


class MatchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SoccerApp(),
    );
  }
  
}

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0.0,
        title: Text(
          "SOCCERBOARD",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      //now we have finished the api service let's call it
      //Now befo re we create Our layout let's create our API service
      body: FutureBuilder(
        future: FutbolService().getLiga(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            print(snapshot.data);
            return Container(
              child:Text('kawamas')
            );
          }else{
            return Center(
              child: CircularProgressIndicator()
            );
          }
        }
      ),
    );
  }
}
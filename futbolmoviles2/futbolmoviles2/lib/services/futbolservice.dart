import 'dart:convert';
import '../models/matchmodel.dart';
import 'package:http/http.dart';
import '../models/standingmodel.dart';

class FutbolService {
  final String apiUrl = "https://v3.football.api-sports.io/fixtures?live=all";
  final String ligasApiUrl ="https://v3.football.api-sports.io/standings?league=39&season=2019";
  
  var futbolheaders = {
  'x-rapidapi-key': 'd24ce2cfc8642a4c1d1baac976dfc998',
  'x-rapidapi-host': 'v3.football.api-sports.io'
  };

  Future<List<FutbolMatch>> getPartidos() async{
    Response res = await get(Uri.parse(apiUrl),headers: futbolheaders);
    var body;
    if(res.statusCode == 200) {
      body= jsonDecode(res.body);
      List<dynamic> partidosList = body['response'];
      print(res.body);
      List<FutbolMatch> matches = partidosList
        .map((dynamic item)=> FutbolMatch.fromJson(item))
        .toList();
      print('si jalo la recoleccion de informacion');
      print(matches);
      print('si jalo la recoleccion de informacion');
      return matches;
    }else{
      throw Exception('Fallo al cargar los partidos');
    }
    
  }


   Future<List<Liga>> getLiga() async {
     Response res = await get(Uri.parse(ligasApiUrl),headers: futbolheaders);
     var body;
     if(res.statusCode == 200){
       body = jsonDecode(res.body);
       List<dynamic> ligaList = body['response'];
       List<Liga> ligas = ligaList
        .map((dynamic item)=> Liga.fromJson(item))
        .toList();
        print(ligas);
        return ligas;

     }else{
       throw Exception('Fallo al cargar');
     }
   }
  

}
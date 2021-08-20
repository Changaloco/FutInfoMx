import 'package:http/http.dart';
import 'dart:convert';
import '../models/matchmodel.dart';
class FutbolApi{

  final String apiUrl = "https://v3.football.api-sports.io/fixtures?live=all";

  final String apiKey = "d24ce2cfc8642a4c1d1baac976dfc998";

  static const  headers = {
    'x-rapidapi-host' : "v3.football.api-sports.io",
	  'x-rapidapi-key' : "d24ce2cfc8642a4c1d1baac976dfc998"

  };
  Future<List<FutbolMatch>> getAllMatches() async{
    Response res = await get(Uri.parse(apiUrl),headers:headers);
    var body;
    if(res.statusCode == 200){
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body["response"];
      // ignore: unnecessary_brace_in_string_interps
      print("Api Service: ${body}");
      List<FutbolMatch> matches = matchesList.map((dynamic item)=>
      FutbolMatch.fromJson(item)).toList();
      return matches;
    }
    return body;
  }


  
}
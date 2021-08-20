import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PartidosList extends StatefulWidget {
  final String code;
  const PartidosList({Key? key, required this.code}) : super(key: key);
  @override
  _PartidosList createState() => _PartidosList();
}

class _PartidosList extends State<PartidosList> {
  late List _table;
  getMatches() async {
    http.Response response = await http.get(
        Uri.parse(
            'https://api.football-data.org/v2/teams/${widget.code}/matches?status=SCHEDULED'),
        headers: {'X-Auth-Token': '6882ce79b8834f2ba13922113043b30f'});
    String body = response.body;
    Map data = jsonDecode(body);
    List table = data["matches"];
    print(table);
    setState(() {
      _table = table;
    });
  }

  getTeam(int id) async {
    http.Response res = await http.get(
        // ignore: unnecessary_brace_in_string_interps
        Uri.parse('http://api.football-data.org/v2/teams/${id}'),
        headers: {'X-Auth-Token': '6882ce79b8834f2ba13922113043b30f'});
    var body;
    if(res.statusCode == 200){
      body= jsonDecode(res.body);
      Map datos = body;
      var equipoId = datos['id'];
      var name = datos['shortName'];
      var crestUrl = datos['crestUrl'];
      var tla = datos['tla'];
      List data = [];
      data.add(equipoId);
      data.add(name);
      data.add(crestUrl);
      data.add(tla);
      return data;
    }else{
      throw Exception('Fallo al cargar los partidos');
    }
  }

  @override
  void initState() {
    super.initState();
    getMatches();
  }

  Widget buildMatches() {
    List<Widget> matches = [];
    for (var match in _table) {
      
  
      matches.add(
        Scaffold(
          body: FutureBuilder(
            future: getTeam(match['homeTeam']['id']),
            builder:(context,snapshot){
              if(snapshot.hasData){
                print(snapshot.data);
                var data = snapshot.data;
                List? info = data as List?;
                return Container(
                  child:Center(
                    child:Text(info![1])
                  )
                );
              }else{
                return Container(
                  child:Center(
                  child:Text('funciona no correctamente')
                  )
                );
              }
            }
          )
        ));

    }
    return Column(children: matches);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: Color(0xFFFAFAFA),
          elevation: 0.0,
          title: Text(
            "Proximos Partidos",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
            child: ListView(
          children: [buildMatches()],
        )));
  }
}

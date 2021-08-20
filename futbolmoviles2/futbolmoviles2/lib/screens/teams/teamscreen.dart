import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';

class TeamScreen extends StatelessWidget {
  final int code;
  const TeamScreen({Key? key, required this.code}) : super(key: key);

  getTeam(int id) async {
    http.Response res = await http.get(
        // ignore: unnecessary_brace_in_string_interps
        Uri.parse('http://api.football-data.org/v2/teams/${id}'),
        headers: {'X-Auth-Token': '6882ce79b8834f2ba13922113043b30f'});
    var body;
    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      Map datos = body;
      var equipoId = datos['id'];
      var name = datos['shortName'];
      var crestUrl = datos['crestUrl'];
      var tla = datos['tla'];
      var jugadores = datos['squad'];
      List data = [];
      data.add(equipoId);
      data.add(name);
      data.add(crestUrl);
      data.add(tla);
      data.add(jugadores);
      return data;
    } else {
      throw Exception('Fallo al cargar los partidos');
    }
  }

  Widget buildPlayerList(List jugadoresList) {
    List<Widget> jugadores = [];
    for (var jugador in jugadoresList) {
      jugadores.add(Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(jugador['name']),
                    Text(jugador['position']),
                    Text(jugador['nationality'])
                  ]))
            ],
          )));
    }
    return Column(children: jugadores);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getTeam(code),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                var data = snapshot.data;
                List? info = data as List?;
                print(info![1]);
                return Scaffold(
                    body: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            const Color(0xffe),
                            const Color(0xffe),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(0.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        )),
                        child: ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: [
                            Center(
                                child: Column(
                              children: [
                                SizedBox(height: 10),
                                Text(info[1],style:TextStyle(
                                  fontFamily:"Montserrat",
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                )),
                                SvgPicture.network(
                                  info[2],
                                  height: 200,
                                  width: 200,
                                ),
                              ],
                            )),
                            SizedBox(height: 20),
                            Center(
                              child: Text('Plantilla',style:TextStyle(
                              fontFamily:"Montserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ))
                            ),
                            SizedBox(height: 20),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(children: [
                                  Expanded(
                                    child: Row(children: [
                                      Text('Nombre',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width:90),
                                      Text('Posicion',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width:100),
                                      Text('Pais',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ]),
                                  )
                                ])),
                            SizedBox(height: 10),
                            buildPlayerList(info[4])
                          ],
                        )));
              } else {
                return Container(child: Center(child: Text('el barcelomas')));
              }
            }));
  }
}

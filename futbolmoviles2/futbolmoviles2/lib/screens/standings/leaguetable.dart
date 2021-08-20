import 'package:flutter/material.dart';
import '../../models/standingmodel.dart';

// ignore: non_constant_identifier_names
Widget LeagueTable(List<Liga> liga) {
  var nombreliga = liga[0].name;
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          const Color(0xffe84860),
          const Color(0xffe70066),
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
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        'Pos',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Club',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // ignore: unnecessary_brace_in_string_interps
                        '${nombreliga}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'W',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'D',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'L',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'GD',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pts',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          
        ],
      ),
    ),
  );
}

Widget buildTable(List<Liga> ligasEquipos){
  return Column(
    
  );
}
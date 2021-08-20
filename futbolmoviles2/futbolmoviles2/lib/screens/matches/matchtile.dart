import 'package:flutter/material.dart';
import '../../models/matchmodel.dart';

Widget matchTile(FutbolMatch match) {
  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;
  // ignore: unnecessary_null_comparison
  if (homeGoal == null) homeGoal = 0;
  // ignore: unnecessary_null_comparison
  if (awayGoal == null) awayGoal = 0;

  return Container(
    margin: EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            match.home.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        Image.network(
          match.home.logoUrl,
          width: 36.0,
        ),
        Expanded(
          child: Text(
            // ignore: unnecessary_brace_in_string_interps
            "${homeGoal} - ${awayGoal}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        Image.network(
          match.away.logoUrl,
          width: 36.0,
        ),
        Expanded(
          child: Text(
            match.away.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    ),
  );
}
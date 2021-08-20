import 'package:flutter/material.dart';

Widget goalStat(int expandedTime, int homeGoal, int awayGoal) {
  var home = homeGoal;
  var away = awayGoal;
  var elapsed = expandedTime;
  // ignore: unnecessary_null_comparison
  if (home == null) home = 0;
  // ignore: unnecessary_null_comparison
  if (away == null) away = 0;
  // ignore: unnecessary_null_comparison
  if (elapsed == null) elapsed = 0;
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          // ignore: unnecessary_brace_in_string_interps
          "${elapsed}'",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              // ignore: unnecessary_brace_in_string_interps
              "${home} - ${away}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36.0,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
class Liga{
int id;
String name;
String country;
String logoUrl;
Standings standings;
Liga(this.id,this.name,this.country,this.logoUrl,this.standings);
factory Liga.fromJson(Map<String,dynamic>json){
  return Liga(
    json['id'],
    json['name'],
    json['country'],
    json['logo'],
    Standings.fromJson(json['standings'])
  );
}
}

class Standings{
int rank;
int points;
int goalsDiffs;
Team teams;
All all;
Standings(this.rank,this.points,this.goalsDiffs,this.teams,this.all);
factory Standings.fromJson(Map<String,dynamic>json){
  return Standings(
    json['rank'],
    json['points'],
    json['goalsDiff'],
    Team.fromJson(json['team']),
    All.fromJson(json['all'])
  );
}
}

class Team{
int id;
String name;
String logoUrl;
Team(this.id,this.name,this.logoUrl);
factory Team.fromJson(Map<String,dynamic>json){
  return Team(
    json['id'],
    json['name'],
    json['logo'],
  );
}
}

class All{
int played;
int win;
int draw;
int lose;
Goals goals;
All(this.played,this.win,this.draw,this.lose,this.goals);
factory All.fromJson(Map<String,dynamic>json){
  return All(
    json['played'],
    json['win'],
    json['draw'],
    json['lose'],
    Goals.fromJson(json['goals'])
  );
}
}

class Goals{
int favor;
int against;
Goals(this.favor,this.against);
factory Goals.fromJson(Map<String,dynamic>json){
  return Goals(
    json['for'],
    json['against']
  );
}
}


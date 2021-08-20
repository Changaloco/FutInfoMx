class Equipo{
  String shortName;
  String name;
  String crestUrl;
  String tla;
  Equipo(this.shortName,this.name,this.crestUrl,this.tla);
  factory Equipo.fromJson(Map<String,dynamic>json){
  return Equipo(
    json['shortname'],
    json['name'],
    json['crestUrl'],
    json['tla'],
    
  );
}
}
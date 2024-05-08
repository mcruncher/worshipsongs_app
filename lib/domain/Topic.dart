import '../service/GenericService.dart';

class Topic
{
  String name = "";
  String tamilName;
  String defaultName;
  int songs;

  Topic({required this.name, required this.tamilName, required this.defaultName, required this.songs});

  factory Topic.fromMap(Map<String, dynamic> json) => Topic(
    name: json["name"],
    tamilName: GenericService().parseTamilName(json["name"]),
    defaultName: GenericService().parseEnglishName((json["name"])),
    songs: json["songs"],
  );
}
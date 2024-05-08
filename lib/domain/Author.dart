import 'package:worshipsongs_app/parser/TitleParser.dart';

class Author
{
  String name = "";
  int songs;
  String tamilName;
  String defaultName;

  Author({required this.name, required this.songs, required this.tamilName, required this.defaultName});

  factory Author.fromMap(Map<String, dynamic> json) => Author(
      name: json["display_name"],
      songs: json["songs"],
      tamilName: TitleParser().parseFirstLangugaeTitle(json["display_name"]),
      defaultName: TitleParser().parseSecondLangugaeTitle(json["display_name"]),
  );
}
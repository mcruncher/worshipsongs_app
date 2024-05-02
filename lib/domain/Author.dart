import 'package:worshipsongs_app/service/AuthorService.dart';

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
      tamilName: AuthorService().parseTamilName(json["display_name"]),
      defaultName: AuthorService().parseEnglishName(json["display_name"]),
  );
}
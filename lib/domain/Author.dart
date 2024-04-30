class Author
{
  String display_name = "";
  int songs;

  Author({required this.display_name, required this.songs});

  factory Author.fromMap(Map<String, dynamic> json) => Author(
      display_name: json["display_name"],
      songs: json["songs"],
  );
}
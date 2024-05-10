class Author
{
  String name = "";
  int songs;

  Author({required this.name, required this.songs});

  factory Author.fromMap(Map<String, dynamic> json) => Author(
      name: json["display_name"],
      songs: json["songs"],
  );
}
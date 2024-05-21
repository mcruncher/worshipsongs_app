class Author
{
  int id;
  String name = "";
  int songs;

  Author({required this.id, required this.name, required this.songs});

  factory Author.fromMap(Map<String, dynamic> json) => Author(
      id: json["id"],
      name: json["display_name"],
      songs: json["songs"],
  );
}
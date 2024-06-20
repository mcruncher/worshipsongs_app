class Topic
{
  int id;
  String name = "";
  int songs;

  Topic({required this.id, required this.name, required this.songs});

  factory Topic.fromMap(Map<String, dynamic> json) => Topic(
    id: json["id"],
    name: json["name"],
    songs: json["songs"],
  );
}
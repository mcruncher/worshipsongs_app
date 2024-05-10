class Topic
{
  String name = "";
  int songs;

  Topic({required this.name, required this.songs});

  factory Topic.fromMap(Map<String, dynamic> json) => Topic(
    name: json["name"],
    songs: json["songs"],
  );
}
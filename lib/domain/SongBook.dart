class SongBook
{
  int id;
  String publisher = "";
  int songs;

  SongBook({required this.id, required this.publisher, required this.songs});

  factory SongBook.fromMap(Map<String, dynamic> json) => SongBook(
    id: json["id"],
    publisher: json["name"],
    songs: json["songs"],
  );
}
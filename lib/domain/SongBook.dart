class SongBook
{
  String publisher = "";
  int songs;

  SongBook({required this.publisher, required this.songs});

  factory SongBook.fromMap(Map<String, dynamic> json) => SongBook(
    publisher: json["name"],
    songs: json["songs"],
  );
}
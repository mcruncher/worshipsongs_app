class Song {
  int id;
  String title = "";
  String? alternateTitle = "";
  String lyrics = "";
  String? verseOrder = "";
  String? lastModified;
  String? comment  = "";


  Song({required this.id, required this.title, this.alternateTitle, required this.lyrics, this.verseOrder,
      this.lastModified, this.comment});

  factory Song.fromMap(Map<String, dynamic> json) => Song(
      id: json["id"],
      title: json["title"],
      alternateTitle: json["alternate_title"],
      lyrics: json["lyrics"],
      verseOrder: json["verse_order"],
      lastModified: json["last_modified"],
      comment: json["comments"]
  );
}
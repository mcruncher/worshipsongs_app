import 'package:worshipsongs_app/db/DatabaseHandler.dart';

import '../domain/SongBook.dart';

class SongBookService
{
  String query = "select songbook.id, songbook.name as name, songbook.publisher as publisher, count(songbook.id)as songs from songs as song, songs_songbooks as songsongbooks, song_books as songbook  where songsongbooks.song_id=song.id  and songbook.id=songsongbooks.songbook_id group by songbook.name";

  Future<List> findSongBooks() async {
    return DatabaseHandler().retrieveAttributes(query);
  }

  Future<List<SongBook>> getSongBooks() async {
    List response = await findSongBooks();
    return response.map((c) => SongBook.fromMap(c)).toList();
  }
}
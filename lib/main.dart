import 'package:flutter/material.dart';
import 'package:worshipsongs_app/views/TabBarWidgets.dart';

import 'db/DatabaseHandler.dart';
import 'domain/Author.dart';
import 'domain/Song.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Song> songs = await DatabaseHandler().findAllSongs();
  List<Author> authors = await DatabaseHandler().findAllAuthors();
  List<Map> books = await DatabaseHandler().retrieveAttributes('select sb.name, count(ssb.song_id) as songs from song_books sb, songs_songbooks ssb where sb.id = ssb.songbook_id group by sb.name', 'name');
  List<Map> topics = await DatabaseHandler().retrieveAttributes('select t.name, count(st.song_id) as songs from topics t, songs_topics st where t.id = st.topic_id group by t.name', 'name');
  runApp(TabBarWidgets(
    songs: songs,
    authors: List<Author>.generate(authors.length, (i) => authors[i]),
    books: List<Map>.generate(books.length, (i) => books[i]),
    topics: List<Map>.generate(topics.length, (i) => topics[i]),
  ));
}
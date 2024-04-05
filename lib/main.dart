import 'package:flutter/material.dart';
import 'package:worshipsongs_app/views/TabBarWidgets.dart';

import 'db/DatabaseHandler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Map> songs = await DatabaseHandler()
      .getSongs();
  List<Map> authors = await DatabaseHandler().retrieveAttributes('SELECT a.display_name, count(auths.song_id) as songs from authors a, authors_songs auths where auths.author_id = a.id group by a.display_name', 'display_name');
  List<Map> books = await DatabaseHandler().retrieveAttributes('select sb.name, count(ssb.song_id) as songs from song_books sb, songs_songbooks ssb where sb.id = ssb.songbook_id group by sb.name', 'name');
  List<Map> topics = await DatabaseHandler().retrieveAttributes('select t.name, count(st.song_id) as songs from topics t, songs_topics st where t.id = st.topic_id group by t.name', 'name');
  runApp(TabBarWidgets(
    songs: songs,
    authors: List<Map>.generate(authors.length, (i) => authors[i]),
    books: List<Map>.generate(books.length, (i) => books[i]),
    topics: List<Map>.generate(topics.length, (i) => topics[i]),
  ));
}
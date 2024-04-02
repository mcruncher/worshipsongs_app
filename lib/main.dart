import 'dart:io';

import 'package:flutter/material.dart';
import 'package:worshipsongs_app/views/TabBarViews.dart';
import 'package:worshipsongs_app/widgets/ListViewWidget.dart';

import 'db/DatabaseHandler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Map> songs = await DatabaseHandler()
      .retrieveAttributes('SELECT title, comments FROM songs', 'title');
  List<Map> authors = await DatabaseHandler().retrieveAttributes('SELECT a.display_name, count(auths.song_id) as songs from authors a, authors_songs auths where auths.author_id = a.id group by a.display_name', 'display_name');
  List<Map> books = await DatabaseHandler().retrieveAttributes('select sb.name, count(ssb.song_id) as songs from song_books sb, songs_songbooks ssb where sb.id = ssb.songbook_id group by sb.name', 'name');
  List<Map> topics = await DatabaseHandler().retrieveAttributes('select t.name, count(st.song_id) as songs from topics t, songs_topics st where t.id = st.topic_id group by t.name', 'name');
  runApp(MyApp(
    songs: List<Map>.generate(songs.length, (index) => songs[index]),
    authors: List<Map>.generate(authors.length, (i) => authors[i]),
    books: List<Map>.generate(books.length, (i) => books[i]),
    topics: List<Map>.generate(topics.length, (i) => topics[i]),
  ));
}

class MyApp extends StatefulWidget {
  final List<Map> songs;
  final List<Map> authors;
  final List<Map> books;
  final List<Map> topics;

  MyApp({super.key, required this.songs, required this.authors, required this.books,required this.topics});

  @override
  State<MyApp> createState() => MyAppPageState(songs, authors, books, topics);
}

class MyAppPageState extends State<MyApp> {
  final List<Map> songs;
  final List<Map> authors;
  final List<Map> books;
  final List<Map> topics;

  MyAppPageState(this.songs, this.authors, this.books, this.topics);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Worship Songs"),
            bottom: new TabBarViews().mainTabBar(),
          ),
          body: TabBarView(
            children: <Widget>[
              new ListViewWidget()
                  .defaultListView(songs, "title", oddItemColor, evenItemColor),
              new ListViewWidget()
                  .defaultListView(authors, "display_name", oddItemColor, evenItemColor),
              new ListViewWidget()
                  .defaultListView(books, "name", oddItemColor, evenItemColor),
              new ListViewWidget()
                  .defaultListView(topics, "name", oddItemColor, evenItemColor),
            ],
          ),
        ),
      ),
    );
  }
}

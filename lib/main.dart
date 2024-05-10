import 'package:flutter/material.dart';
import 'package:worshipsongs_app/widget/BottomNavigationBarWidget.dart';

import 'db/DatabaseHandler.dart';
import 'domain/Author.dart';
import 'domain/Song.dart';
import 'domain/Topic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Song> songs = await DatabaseHandler().findAllSongs();
  List<Author> authors = await DatabaseHandler().findAuthors();
  List<Topic> topics = await DatabaseHandler().findTopics();
  runApp(BottomNavigationBarWidget(
    songs: songs, authors: authors, topics: topics
  ));
}
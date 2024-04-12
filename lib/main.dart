import 'package:flutter/material.dart';
import 'package:worshipsongs_app/views/BottomNavigationBarWidget.dart';

import 'db/DatabaseHandler.dart';
import 'domain/Song.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Song> songs = await DatabaseHandler().findAllSongs();
  runApp(BottomNavigationBarWidget(
    songs: songs,
  ));
}
import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/domain/SongBook.dart';
import '../domain/Song.dart';
import '../domain/Topic.dart';
import 'BottomNavigationBarState.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final List<Song> songs;
  final List<Author> authors;
  final List<Topic> topics;
  final List<SongBook> songBooks;
  final bool showFirstLanguage;
  final bool showSecondLanguage;

  const BottomNavigationBarWidget({super.key, required this.songs, required this.authors, required this.topics, required this.songBooks, required this.showFirstLanguage, required this.showSecondLanguage});

  @override
  State<BottomNavigationBarWidget> createState() => BottomNavigationBarState(songs, authors, topics, songBooks, showFirstLanguage, showSecondLanguage);
}
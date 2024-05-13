import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/service/AppThemeService.dart';
import 'package:worshipsongs_app/widget/TopicTitleWidget.dart';

import '../domain/SongBook.dart';
import '../domain/Topic.dart';
import 'AuthorTitleWidget.dart';
import 'BottomNavigationBarWidget.dart';
import 'SongBookWidget.dart';
import 'SongTitleWidget.dart';

class BottomNavigationBarState extends State<BottomNavigationBarWidget> {
  final List<Song> songs;
  final List<Author> authors;
  final List<Topic> topics;
  final List<SongBook> songBooks;
  int _selectedIndex = 0;

  BottomNavigationBarState(this.songs, this.authors, this.topics, this.songBooks);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _widgetOptions = <Widget>[
      SongTitleWidget(songs: songs),
      AuthorTitleWidget(authors: authors),
      TopicTitleWidget(topics: topics),
      SongBookWidget(songBooks: songBooks),
    ];

    return MaterialApp(
      theme: AppThemeService().getTheme(),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Worship Songs'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Songs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Authors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Topics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Books',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppThemeService().getAppMaterialColor(),
        onTap: _onItemTapped,
      ),
    ),
    );
  }
}
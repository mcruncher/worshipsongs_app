import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/view/BottomNavigationBarWidget.dart';
import 'package:worshipsongs_app/view/TopicTitleView.dart';

import '../domain/Topic.dart';
import 'AuthorTitleView.dart';
import 'SongTitleView.dart';

class BottomNavigationBarState extends State<BottomNavigationBarWidget> {
  final List<Song> songs;
  final List<Author> authors;
  final List<Topic> topics;
  int _selectedIndex = 0;

  BottomNavigationBarState(this.songs, this.authors, this.topics);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _widgetOptions = <Widget>[
      SongTitleView(songs: songs),
      AuthorTitleView(authors: authors),
      TopicTitleView(topics: topics),
    ];

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple,
        brightness: Brightness.light,
        ),
      ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Worship Songs'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Title',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Author',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Topic',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[800],
        onTap: _onItemTapped,
      ),
    ),
    );
  }
}
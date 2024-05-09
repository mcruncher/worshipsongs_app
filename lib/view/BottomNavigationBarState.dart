import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/view/BottomNavigationBarWidget.dart';

import '../domain/Topic.dart';
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    List<Widget> _widgetOptions = <Widget>[
      SongTitleView(songs: songs),
      _listViewAuthor(oddItemColor, evenItemColor),
      _listViewTopic(oddItemColor, evenItemColor),
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

  Widget _listViewAuthor(Color oddItemColor, Color evenItemColor) {
    return ListView.builder(
        itemCount: authors.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text(authors[index].defaultName),
            subtitle: Text('${authors[index].songs.toString()} songs'),
            onTap: () {
              print(authors[index].name);
            },
          );
        }
    );
  }

  Widget _listViewTopic(Color oddItemColor, Color evenItemColor) {
    return ListView.builder(
        itemCount: topics.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text(topics[index].defaultName),
            subtitle: Text('${topics[index].songs.toString()} songs'),
            onTap: () {
              print(topics[index].name);
            },
          );
        }
    );
  }
}
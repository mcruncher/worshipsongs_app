import 'package:flutter/material.dart';
import 'package:worshipsongs_app/component/SongSearchDelegate.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/service/AppThemeService.dart';
import 'package:worshipsongs_app/widget/TopicTitleWidget.dart';

import '../component/AuthorSearchDelegate.dart';
import '../component/SongBookSearchDelegate.dart';
import '../component/TopicSearchDelegate.dart';
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
    AppThemeService appThemeService = new AppThemeService();
    List<Widget> _widgetOptions = <Widget>[
      SongTitleWidget(songs: songs),
      AuthorTitleWidget(authors: authors),
      TopicTitleWidget(topics: topics),
      SongBookWidget(songBooks: songBooks),
    ];

    return MaterialApp(
      theme: appThemeService.getTheme(),
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
        selectedItemColor: appThemeService.getAppMaterialColor(),
        onTap: _onItemTapped,
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          child: const Icon(Icons.search),
          onPressed: () async {
            await showSearch(
              context: context,
              delegate: getSearchDelegate(),
            );
          },
        ),
      ),
    ),
    );
  }

  SearchDelegate<dynamic> getSearchDelegate()  {
    switch (_selectedIndex) {
      case 0:
        return SongSearchDelegate(searchList: songs);
      case 1:
        return AuthorSearchDelegate(searchList: authors);
      case 2:
        return TopicSearchDelegate(searchList: topics);
      case 3:
        return SongBookSearchDelegate(searchList: songBooks);
      default :
        return SongSearchDelegate(searchList: songs);
    }

  }

}
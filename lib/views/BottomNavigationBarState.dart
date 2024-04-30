import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/service/AuthorService.dart';
import 'package:worshipsongs_app/views/BottomNavigationBarWidget.dart';

class BottomNavigationBarState extends State<BottomNavigationBarWidget> {
  final List<Song> songs;
  final List<Author> authors;
  int _selectedIndex = 0;

  BottomNavigationBarState(this.songs, this.authors);

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
      _listViewBody(oddItemColor, evenItemColor),
      _listViewAuthor(oddItemColor, evenItemColor),
      _listViewBody(oddItemColor, evenItemColor),
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
            icon: Icon(Icons.book),
            label: 'Book',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[800],
        onTap: _onItemTapped,
      ),
    ),
    );
  }

  Widget _listViewBody(Color oddItemColor, Color evenItemColor) {
    return ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text(songs[index].title),
            onTap: () {
            },
          );
        }
    );
  }

  Widget _listViewAuthor(Color oddItemColor, Color evenItemColor) {
    return ListView.builder(
        itemCount: authors.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text(AuthorService().authorNameByLanguage(authors[index].display_name)),
            subtitle: Text('${authors[index].songs.toString()} songs'),
            onTap: () {
              print(authors[index].display_name);
            },
          );
        }
    );
  }
}
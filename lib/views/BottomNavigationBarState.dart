import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/views/BottomNavigationBarWidget.dart';

class BottomNavigationBarState extends State<BottomNavigationBarWidget> {
  final List<Song> songs;
  int _selectedIndex = 0;

  BottomNavigationBarState(this.songs);

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
        child: _listViewBody(oddItemColor, evenItemColor),
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
}
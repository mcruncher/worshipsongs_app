import 'dart:io';

import 'package:flutter/material.dart';

import 'db/DatabaseHandler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Map> songs = await DatabaseHandler().retrieveAttributes('SELECT title, comments FROM songs', 'title');
  runApp(MyApp(
    songs: List<Map>.generate(songs.length, (index) => songs[index]),
  ));
}

class MyApp extends StatefulWidget {
  final List<Map> songs;

  MyApp({super.key, required this.songs});

  @override
  State<MyApp> createState() => MyAppPageState(songs);
}

class MyAppPageState extends State<MyApp> {
  final List<Map> songs;
  MyAppPageState(this.songs);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Worship Songs"),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              icon: const Icon(Icons.text_fields),
              text: 'Title',
            ),
            Tab(
              icon: const Icon(Icons.account_box),
              text: 'Author',
            ),
            Tab(
              icon: const Icon(Icons.book),
              text: 'Book',
            ),
            Tab(
              icon: const Icon(Icons.topic_sharp),
              text: 'Topic',
            ),
          ],
        ),
            ),
      body: TabBarView(
        children: <Widget>[
          _defaultListView(),
        ],
      ),
    ),
      ),
    );
  }

  Widget _defaultListView() {
    String username = "Worship Songs";
    List<String> searchKeywords = List<String>.generate(
        username.length,
            (index) => username[index]);
      return ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(songs[index]["title"]),
            // subtitle: Text(prepareTamilTitle(items[index]['title'].toString(), items[index]['comments'].toString())),
            onTap: () {
              //print('The tamil value is ${items[index]['comments']}');

            },
          );
        },
      );
    }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:worshipsongs_app/widgets/TabBarWidget.dart';

import 'db/DatabaseHandler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Map> songs = await DatabaseHandler()
      .retrieveAttributes('SELECT title, comments FROM songs', 'title');
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Worship Songs"),
            bottom: new TabBarWidget().mainTabBar(),
          ),
          body: TabBarView(
            children: <Widget>[
              _defaultListView(oddItemColor, evenItemColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _defaultListView(Color oddItemColor, Color evenItemColor) {
    String username = "Worship Songs";
    List<String> searchKeywords =
        List<String>.generate(username.length, (index) => username[index]);
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          tileColor: index.isOdd ? oddItemColor : evenItemColor,
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

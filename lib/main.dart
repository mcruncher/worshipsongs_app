import 'dart:io';

import 'package:flutter/material.dart';

import 'db/DatabaseHandler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // List<Map> songs = await DatabaseHandler().retrieveAttributes('SELECT title, comments FROM songs', 'title');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worship Songs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Worship Songs Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
        itemCount: searchKeywords.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(searchKeywords[index]),
            // subtitle: Text(prepareTamilTitle(items[index]['title'].toString(), items[index]['comments'].toString())),
            onTap: () {
              //print('The tamil value is ${items[index]['comments']}');

            },
          );
        },
      );
    }
}

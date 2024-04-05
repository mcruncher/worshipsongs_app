import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/ListViewWidget.dart';
import 'TabBarViews.dart';

class TabBarWidgets extends StatelessWidget {
  final List<Map> songs;
  final List<Map> authors;
  final List<Map> books;
  final List<Map> topics;

  const TabBarWidgets({super.key, required this.songs, required this.authors, required this.books, required this.topics});

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
            bottom: new TabBarViews().mainTabBar(),
          ),
          body: TabBarView(
            children: <Widget>[
              new ListViewWidget()
                  .defaultListView(songs, "title", oddItemColor, evenItemColor),
              new ListViewWidget()
                  .defaultListView(authors, "display_name", oddItemColor, evenItemColor),
              new ListViewWidget()
                  .defaultListView(books, "name", oddItemColor, evenItemColor),
              new ListViewWidget()
                  .defaultListView(topics, "name", oddItemColor, evenItemColor),
            ],
          ),
        ),
      ),
    );
  }
}
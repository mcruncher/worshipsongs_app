import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../domain/Song.dart';
import '../widgets/ListViewWidget.dart';
import 'TabBarViews.dart';

class TabBarWidgets extends StatelessWidget {
  final List<Song> songs;

  const TabBarWidgets({super.key, required this.songs});

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
            ],
          ),
        ),
      ),
    );
  }
}
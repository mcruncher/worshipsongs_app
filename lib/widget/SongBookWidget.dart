import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../domain/SongBook.dart';
import '../parser/TitleParser.dart';

class SongBookWidget extends StatelessWidget
{
  final List<SongBook> songBooks;
  SongBookWidget({required this.songBooks});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme
        .of(context)
        .colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return ListView.builder(
        itemCount: songBooks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text(TitleParser().parseTitleByLanguage(songBooks[index].publisher)),
            subtitle: Text('${songBooks[index].songs.toString()} songs'),
            onTap: () {
              print(songBooks);
            },
          );
        }
    );
  }

}
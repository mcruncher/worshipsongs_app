import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../domain/SongBook.dart';
import '../parser/TitleParser.dart';
import '../service/AppThemeService.dart';

class SongBookWidget extends StatelessWidget
{
  final List<SongBook> songBooks;
  SongBookWidget({required this.songBooks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: songBooks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? AppThemeService().getOddItemColor(context) : AppThemeService().getEvenItemColor(context),
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worshipsongs_app/parser/TitleParser.dart';

import '../domain/Author.dart';
import '../service/AppThemeService.dart';
import 'AuthorSongTitleWidget.dart';

class AuthorTitleWidget extends StatelessWidget
{
  final List<Author> authors;
  AuthorTitleWidget({required this.authors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: authors.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? AppThemeService().getOddItemColor(context) : AppThemeService().getEvenItemColor(context),
            title: Text(TitleParser().parseTitleByLanguage(authors[index].name)),
            subtitle: Text('${authors[index].songs.toString()} songs'),
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (ct) => AuthorSongTitleWidget(authors[index]),
                  ));
            },
          );
        }
    );
  }
}
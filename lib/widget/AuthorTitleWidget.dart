import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worshipsongs_app/parser/TitleParser.dart';

import '../domain/Author.dart';
import '../service/AppThemeService.dart';

class AuthorTitleWidget extends StatelessWidget
{
  final List<Author> authors;
  AuthorTitleWidget({required this.authors});

  @override
  Widget build(BuildContext context) {
    AppThemeService appThemeService = new AppThemeService();
    return ListView.builder(
        itemCount: authors.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? appThemeService.getOddItemColor(context) : appThemeService.getEvenItemColor(context),
            title: Text(TitleParser().parseTitleByLanguage(authors[index].name)),
            subtitle: Text('${authors[index].songs.toString()} songs'),
            onTap: () {
              print(authors[index].name);
            },
          );
        }
    );
  }
}
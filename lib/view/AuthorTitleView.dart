import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/Author.dart';

class AuthorTitleView extends StatelessWidget
{
  final List<Author> authors;
  AuthorTitleView({required this.authors});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme
        .of(context)
        .colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return ListView.builder(
        itemCount: authors.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text(authors[index].defaultName),
            subtitle: Text('${authors[index].songs.toString()} songs'),
            onTap: () {
              print(authors[index].name);
            },
          );
        }
    );
  }
}
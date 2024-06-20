import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Author.dart';

import '../widget/AuthorTitleWidget.dart';
import 'AbstractSearchDelegate.dart';


class AuthorSearchDelegate extends AbstractSearchDelegate<dynamic> {
  final List<Author> searchList;

  AuthorSearchDelegate({required this.searchList});

  @override
  Widget buildResults(BuildContext context) {
    final List<Author> searchResults = searchList
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return AuthorTitleWidget(authors: searchResults);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Author> suggestionList = query.isEmpty
        ? searchList
        : searchList
        .where((item) =>
        item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return AuthorTitleWidget(authors: suggestionList);
  }
}

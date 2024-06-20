import 'package:flutter/material.dart';
import 'package:worshipsongs_app/widget/SongBookWidget.dart';

import '../domain/SongBook.dart';
import 'AbstractSearchDelegate.dart';


class SongBookSearchDelegate extends AbstractSearchDelegate<dynamic> {
  final List<SongBook> searchList;

  SongBookSearchDelegate({required this.searchList});

  @override
  Widget buildResults(BuildContext context) {
    final List<SongBook> searchResults = searchList
        .where((item) => item.publisher.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return SongBookWidget(songBooks: searchResults);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<SongBook> suggestionList = query.isEmpty
        ? searchList : searchList
        .where((item) =>
        item.publisher.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return SongBookWidget(songBooks: suggestionList);
  }
}

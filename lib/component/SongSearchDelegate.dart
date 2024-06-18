import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/widget/SongTitleWidget.dart';

import 'AbstractSearchDelegate.dart';

class SongSearchDelegate extends AbstractSearchDelegate<dynamic> {
  final List<Song> searchList;

  SongSearchDelegate({required this.searchList});

  // These methods are mandatory you cannot skip them.

  @override
  Widget buildResults(BuildContext context) {
    final List<Song> searchResults = searchList
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return SongTitleWidget(songs: searchResults);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Song> suggestionList = query.isEmpty
        ? searchList
        : searchList
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return SongTitleWidget(songs: suggestionList);
  }
}

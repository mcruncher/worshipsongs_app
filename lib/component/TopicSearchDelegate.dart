import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Topic.dart';

import '../widget/TopicTitleWidget.dart';
import 'AbstractSearchDelegate.dart';


class TopicSearchDelegate extends AbstractSearchDelegate<dynamic> {
  final List<Topic> searchList;

  TopicSearchDelegate({required this.searchList});

  @override
  Widget buildResults(BuildContext context) {
    final List<Topic> searchResults = searchList
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return TopicTitleWidget(topics: searchResults);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Topic> suggestionList = query.isEmpty
        ? searchList
        : searchList
        .where((item) =>
        item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return TopicTitleWidget(topics: suggestionList);
  }
}

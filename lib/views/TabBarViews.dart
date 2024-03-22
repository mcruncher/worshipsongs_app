import 'package:flutter/material.dart';

class TabBarViews {
  TabBar mainTabBar() {
    return new TabBar(
      tabs: <Widget>[
        Tab(
          icon: const Icon(Icons.text_fields),
          text: 'Title',
        ),
        Tab(
          icon: const Icon(Icons.account_box),
          text: 'Author',
        ),
        Tab(
          icon: const Icon(Icons.book),
          text: 'Book',
        ),
        Tab(
          icon: const Icon(Icons.topic_sharp),
          text: 'Topic',
        ),
      ],
    );
  }
}

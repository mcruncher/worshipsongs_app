import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/Topic.dart';
import '../parser/TitleParser.dart';


class TopicTitleWidget extends StatelessWidget
{
  final List<Topic> topics;
  TopicTitleWidget({required this.topics});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme
        .of(context)
        .colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return ListView.builder(
        itemCount: topics.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text(TitleParser().parseTitleByLanguage(topics[index].name)),
            subtitle: Text('${topics[index].songs.toString()} songs'),
            onTap: () {
              print(topics[index].name);
            },
          );
        }
    );
  }
}
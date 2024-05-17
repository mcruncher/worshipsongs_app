import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/Topic.dart';
import '../parser/TitleParser.dart';
import '../service/AppThemeService.dart';


class TopicTitleWidget extends StatelessWidget
{
  final List<Topic> topics;
  TopicTitleWidget({required this.topics});

  @override
  Widget build(BuildContext context) {
    AppThemeService appThemeService = new AppThemeService();
    return ListView.builder(
        itemCount: topics.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? appThemeService.getOddItemColor(context) : appThemeService.getEvenItemColor(context),
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
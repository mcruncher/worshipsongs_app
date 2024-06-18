import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/domain/Topic.dart';
import 'package:worshipsongs_app/widget/SongTitleWidget.dart';

import '../db/DatabaseHandler.dart';
import '../parser/TitleParser.dart';

class TopicSongTitleWidget extends StatelessWidget {
  final Topic topic;
  const TopicSongTitleWidget(this.topic, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(TitleParser().parseTitleByLanguage(topic.name)),
          )
      ),
      body: getWidget(topic.id),
    );
  }

  Widget getWidget(int topicId) => FutureBuilder<List<Song>>(
      future: DatabaseHandler().findSongsByTopic(topicId), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<List<Song>> snapshot) {  // AsyncSnapshot<Your object type>
        if (snapshot.hasData) {
          var data = snapshot.data ?? [];
          return SongTitleWidget(songs: data);
        }
        return CircularProgressIndicator();
      }
  );

}

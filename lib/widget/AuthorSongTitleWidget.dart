import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/widget/SongTitleWidget.dart';

import '../db/DatabaseHandler.dart';
import '../domain/Author.dart';
import '../parser/TitleParser.dart';

class AuthorSongTitleWidget extends StatelessWidget {
  final Author author;
  const AuthorSongTitleWidget(this.author, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(TitleParser().parseTitleByLanguage(author.name)),
          )
      ),
      body: getWidget(author.id),
    );
  }

  Widget getWidget(int authorId) => FutureBuilder<List<Song>>(
      future: DatabaseHandler().findSongsByAuthor(authorId), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<List<Song>> snapshot) {  // AsyncSnapshot<Your object type>
        if (snapshot.hasData) {
          var data = snapshot.data ?? [];
          return SongTitleWidget(songs: data);
        }
        return CircularProgressIndicator();
      }
  );

}

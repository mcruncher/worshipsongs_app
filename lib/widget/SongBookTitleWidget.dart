import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/domain/SongBook.dart';
import 'package:worshipsongs_app/widget/SongTitleWidget.dart';

import '../db/DatabaseHandler.dart';
import '../parser/TitleParser.dart';

class SongBookTitleWidget extends StatelessWidget {
  final SongBook songBook;
  const SongBookTitleWidget(this.songBook, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(TitleParser().parseTitleByLanguage(songBook.publisher)),
          )
      ),
      body: getWidget(songBook.id),
    );
  }

  Widget getWidget(int bookId) => FutureBuilder<List<Song>>(
      future: DatabaseHandler().findSongsByBook(bookId), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<List<Song>> snapshot) {  // AsyncSnapshot<Your object type>
        if (snapshot.hasData) {
          var data = snapshot.data ?? [];
          return SongTitleWidget(songs: data);
        }
        return CircularProgressIndicator();
      }
  );

}

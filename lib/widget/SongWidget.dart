import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import '../component/SongCard.dart';
import '../parser/SongParser.dart';
import '../preference/Preference.dart';

class SongWidget extends StatelessWidget {
  Preference preference = new Preference();
  final Song song;
  bool showFirstLanguage;
  bool showSecondLanguage;
  SongWidget(this.song, this.showFirstLanguage, this.showSecondLanguage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(song.title),
        )
      ),
      body: SongCard(listData: SongParser().parseSong(song, showFirstLanguage, showSecondLanguage)),
    );
  }
}
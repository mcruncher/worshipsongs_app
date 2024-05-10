import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import '../component/SongCard.dart';
import '../parser/SongParser.dart';

class SongWidget extends StatelessWidget {
  final Song song;
  SongWidget(this.song);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(song.title),
        )
      ),
      body: SongCard(listData: SongParser().parseSong(song)),
    );
  }
}
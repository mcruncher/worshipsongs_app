import 'package:flutter/material.dart';
import 'package:worshipsongs_app/component/SongCard.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import '../parser/SongParser.dart';

class SongWidget extends StatelessWidget {
  final Song song;
  SongWidget(this.song);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: SingleChildScrollView(
        child: SongCard(listData: SongParser().parseSong(song)),
      ),
    );
  }
}
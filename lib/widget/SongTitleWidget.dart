import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/service/AppThemeService.dart';

import 'SongWidget.dart';

class SongTitleWidget extends StatelessWidget
{
  final List<Song> songs;
  SongTitleWidget({required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? AppThemeService().getOddItemColor(context) : AppThemeService().getEvenItemColor(context),
            title: Text(songs[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (ct) => SongWidget(songs[index])));
            },
          );
        }
    );
  }
}
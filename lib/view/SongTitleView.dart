import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/view/SongWidget.dart';

class SongTitleView extends StatelessWidget
{
  final List<Song> songs;
  SongTitleView({required this.songs});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme
        .of(context)
        .colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text(songs[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ct) => SongWidget(songs[index])));
            },
          );
        }
    );
  }
}
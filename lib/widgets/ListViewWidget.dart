import 'package:flutter/material.dart';
import 'package:worshipsongs_app/db/DatabaseHandler.dart';

import '../domain/Song.dart';

class ListViewWidget {
  Future<Widget> defaultListView() async {
    List<Song> songs = await DatabaseHandler().findAllSongs();
    return ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            // tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text(getListTitle(songs, index).title),
            // subtitle: Text(prepareTamilTitle(items[index]['title'].toString(), items[index]['comments'].toString())),
            onTap: () {
              print('The tamil value is ${songs[index].comment}');
            },
          );
        }
    );
  }

  Song getListTitle(List<Song> listItems, int index) {
    return listItems[index];
  }
}
import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Author.dart';

import '../domain/Song.dart';

class ListViewWidget {
  Widget defaultListView(List<Song> listItems, String attribute,
      Color oddItemColor, Color evenItemColor) {
    String listTile = "";
    return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (BuildContext context, int index) {
        if(attribute == "title")
          {
            listTile = getListTitle(listItems, "title", index).title;
          }
        return ListTile(
          tileColor: index.isOdd ? oddItemColor : evenItemColor,
          title: Text(listTile),
          // subtitle: Text(prepareTamilTitle(items[index]['title'].toString(), items[index]['comments'].toString())),
          onTap: () {
            print('The tamil value is ${listItems[index].comment}');
            },
        );
      }
    );
  }

  Song getListTitle(List<Song> listItems, String attribute, int index)
  {
    return listItems[index];
  }

  Author getAuthor(List<Author> listItems, String attribute, int index)
  {
    return listItems[index];
  }
}
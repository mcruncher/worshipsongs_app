import 'package:flutter/material.dart';

import '../domain/Song.dart';

class ListViewWidget {
  Widget defaultListView(List<Song> listItems, String attribute,
      Color oddItemColor, Color evenItemColor) {
    return ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text(getListTitle(listItems, attribute, index).title),
            // subtitle: Text(prepareTamilTitle(items[index]['title'].toString(), items[index]['comments'].toString())),
            onTap: () {
              print('The tamil value is ${listItems[index].comment}');
            },
          );
        }
    );
  }

  Song getListTitle(List<Song> listItems, String attribute, int index) {
    return listItems[index];
  }
}
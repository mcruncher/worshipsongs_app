import 'package:flutter/material.dart';

class ListViewWidget {
  Widget defaultListView(List<Map> listItems, String attribute,
      Color oddItemColor, Color evenItemColor) {
    return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          tileColor: index.isOdd ? oddItemColor : evenItemColor,
          title: index == 0 ? Text("No records available") : Text(listItems[index][attribute]),
          // subtitle: Text(prepareTamilTitle(items[index]['title'].toString(), items[index]['comments'].toString())),
          onTap: () {
            print('The tamil value is ${listItems[index]['comments']}');
          },
        );
      },
    );
  }
}
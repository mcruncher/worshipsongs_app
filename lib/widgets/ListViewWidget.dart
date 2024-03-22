import 'package:flutter/material.dart';

class ListViewWidget {
  Widget defaultListView(List<Map> listeItems, String attribute,
      Color oddItemColor, Color evenItemColor) {
    return ListView.builder(
      itemCount: listeItems.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          tileColor: index.isOdd ? oddItemColor : evenItemColor,
          title: Text(listeItems[index][attribute]),
          // subtitle: Text(prepareTamilTitle(items[index]['title'].toString(), items[index]['comments'].toString())),
          onTap: () {
            //print('The tamil value is ${items[index]['comments']}');
          },
        );
      },
    );
  }
}

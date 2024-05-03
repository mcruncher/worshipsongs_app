import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

class SongCard extends StatelessWidget {
  final List<String> listData;

  SongCard({required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListView.builder(
            itemCount: listData.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: StyledText(
                  text: listData[index],
                  tags: {
                    'lang1': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  },
                ) ,
              );
            },
          ),
        ],
      ),
    );
  }
}
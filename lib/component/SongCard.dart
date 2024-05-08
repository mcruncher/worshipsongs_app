import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

class SongCard extends StatelessWidget {
  final List<String> listData;

  SongCard({required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListTile(
                    // tileColor: index.isOdd ? oddItemColor : evenItemColor,
                    title: StyledText(
                      text: listData[index],
                      tags: {
                        'lang1': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                      },
                    ) ,
                  ),
                ),
              );
              },
    );
  }
}
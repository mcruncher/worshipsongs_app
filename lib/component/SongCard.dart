import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

class SongCard extends StatelessWidget {
  final List<String> listData;

  SongCard({required this.listData});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: index.isOdd ? oddItemColor : evenItemColor,
                title: StyledText(
                  text: listData[index],
                  tags: {
                    'lang1': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  },
                ) ,
              );
              },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/views/TabBarWidgets.dart';


void main() {

  List<Map> songs = [{1: new Song(id: 1, title: "Foo", lyrics: '')}, {2: new Song(id: 1, title: "Bar", lyrics: '')}];

  final testableWidget = TabBarWidgets(songs: songs, authors: [], books: [], topics: []);

  testWidgets('Find text', (WidgetTester tester) async {

    await tester.pumpWidget(testableWidget);

    final item = tester.widgetList<ListTile>(find.byType(ListTile)).elementAt(1);
    final expected = item.title as Text;
    expect(expected.data, "Bar");
  });
}

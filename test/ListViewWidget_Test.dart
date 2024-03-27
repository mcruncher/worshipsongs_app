import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/db/DatabaseHandler.dart';
import 'package:worshipsongs_app/main.dart';


void main() {
  List<Map> songs = [{1: new Song(id: 1, title: "Foo")}];

  testWidgets('Listview items count test', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp(songs: songs));

    expect(1, songs.length);
  });
}

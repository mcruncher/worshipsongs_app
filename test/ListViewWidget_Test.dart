import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/db/DatabaseHandler.dart';
import 'package:worshipsongs_app/main.dart';


void main() {
  setUpAll(() => null);
  setUp(() => null);
  tearDown(() => null);
  tearDownAll(() => null);
  
  List<Map> songs = [{1: new Song(id: 1, title: "Foo")}];

  testWidgets('Listview items count test', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp(songs: songs, authors: [], books: [], topics: [],));

    expect(1, songs.length);
  });

  testWidgets(
    'Test description',
        (WidgetTester tester) async {
      // Write your test here

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Hi there!'),
            ),
          ),
        ),
      );

      var finder = find.text("Hi there!");
    },
  );
}

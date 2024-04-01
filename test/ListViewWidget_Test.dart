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

    await tester.pumpWidget(MyApp(songs: songs));

    expect(1, songs.length);
  });

  testWidgets('Listview item - id test', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp(songs: songs));

    expect(1, songs[0].keys.first);
  });

  testWidgets('Listview item - comment test', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp(songs: songs));

    expect('Foo', songs[0].values.first);
  });
}

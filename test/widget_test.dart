// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/widgets/ListViewWidget.dart';

void main() {
  List<Song> songs = [Song(id: 1, title: "Seekiramaai Vanthiduvaen Endru Sonneerae", lyrics: "test lyrics")];
  
  test('Get song title', ()
  {
    expect(ListViewWidget().getListTitle(songs, "title", 0).title, "Seekiramaai Vanthiduvaen Endru Sonneerae");
  });
}

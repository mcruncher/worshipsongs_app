// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/db/DatabaseHandler.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/domain/Song.dart';
import 'package:worshipsongs_app/widgets/ListViewWidget.dart';

void main() {
  List<Song> songs = [Song(id: 1, title: "Seekiramaai Vanthiduvaen Endru Sonneerae", lyrics: "test lyrics")];
  List<Author> authors = [Author(id: 6, firstName: "Fr. S. J.", lastName: "Berchmans", displayName: "Fr. S. J. Berchmans {பெர்க்மான்ஸ்}")];

  test('Check the Song count from a map', ()
  {
    expect(songs.length, 1);
  });
  
  test('Get song title', ()
  {
    expect(ListViewWidget().getListTitle(songs, "title", 0).title, "Seekiramaai Vanthiduvaen Endru Sonneerae");
  });

  test('Get author display name', ()
  {
    expect(ListViewWidget().getAuthor(authors, "displayName", 0).displayName, "Fr. S. J. Berchmans {பெர்க்மான்ஸ்}");
  });
}

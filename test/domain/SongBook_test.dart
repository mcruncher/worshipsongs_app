import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/SongBook.dart';

void main() {
  SongBook song = new SongBook(id: 2, publisher: "publisher", songs: 58);

  test('Get song book title', ()
  {
    expect(song.publisher, "publisher");
  });

  test('Get song count by books', ()
  {
    expect(song.songs, 58);
  });
}
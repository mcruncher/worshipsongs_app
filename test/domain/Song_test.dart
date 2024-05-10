import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/Song.dart';

void main() {
  Song song = new Song(id: 1, title: "Seekiramaai Vanthiduvaen Endru Sonneerae", lyrics: "test lyrics");

  test('Get song title', ()
  {
    expect(song.title, "Seekiramaai Vanthiduvaen Endru Sonneerae");
  });

  test('Get song lyrics', ()
  {
    expect(song.lyrics, "test lyrics");
  });
}
import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/Song.dart';

void main() {
  List<Song> songs = [Song(id: 1, title: "Seekiramaai Vanthiduvaen Endru Sonneerae", lyrics: "test lyrics")];
  
  test('Get song title', ()
  {
    expect(songs[0].title, "Seekiramaai Vanthiduvaen Endru Sonneerae");
  });

  test('Get song lyrics', ()
  {
    expect(songs[0].lyrics, "test lyrics");
  });
}

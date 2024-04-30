import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/domain/Song.dart';

void main() {
  List<Song> songs = [Song(id: 1, title: "Seekiramaai Vanthiduvaen Endru Sonneerae", lyrics: "test lyrics")];
  List<Author> authors = [Author(display_name: "Foo Author", songs: 450), Author(display_name: "Bar Author", songs: 58)];
  
  test('Get song title', ()
  {
    expect(songs[0].title, "Seekiramaai Vanthiduvaen Endru Sonneerae");
  });

  test('Get song lyrics', ()
  {
    expect(songs[0].lyrics, "test lyrics");
  });

  test('Get author name', ()
  {
    expect(authors[0].display_name, 'Foo Author');
  });

  test('Get song count by author', ()
  {
    expect(authors[1].songs, 58);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/domain/Song.dart';

void main() {
  List<Song> songs = [Song(id: 1, title: "Seekiramaai Vanthiduvaen Endru Sonneerae", lyrics: "test lyrics")];
  List<Author> authors = [Author(name: "Foo Author", songs: 450, tamilName: "", defaultName: "Foo Author"), Author(name: "Bar Author", songs: 58, tamilName: "", defaultName: "Bar Author"), Author(name: "Arulanantham {அருளானந்தம்}", songs: 152, tamilName: "அருளானந்தம்", defaultName: "Arulanantham ")];
  
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
    expect(authors[0].name, 'Foo Author');
  });

  test('Get song count by author', ()
  {
    expect(authors[1].songs, 58);
  });
}

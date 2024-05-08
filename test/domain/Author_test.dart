import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/Author.dart';

void main() {
  Author author = new Author(name: "Foo Author", songs: 450, tamilName: "", defaultName: "Foo Author");

  test('Get author name', ()
  {
    expect(author.name, 'Foo Author');
  });

  test('Get song count by author', ()
  {
    expect(author.songs, 450);
  });
}


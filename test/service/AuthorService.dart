import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/service/AuthorService.dart';

void main() {
  List<Author> authors = [Author(name: "Foo Author", songs: 450, tamilName: "", defaultName: "Foo Author"), Author(name: "Bar Author", songs: 58, tamilName: "", defaultName: "Bar Author"), Author(name: "Arulanantham {அருளானந்தம்}", songs: 152, tamilName: "அருளானந்தம்", defaultName: "Arulanantham ")];

  test('Get author name by Tamil language', ()
  {
    expect(AuthorService().parseTamilName(authors[2].name), 'அருளானந்தம்');
  });

  test('Get author name by English language', ()
  {
    expect(AuthorService().parseEnglishName(authors[2].name), 'Arulanantham ');
  });
}

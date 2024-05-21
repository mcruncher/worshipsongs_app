import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/parser/TitleParser.dart';

void main() {
  Author author = new Author(name: "Arulanantham {அருளானந்தம்}", songs: 152, id: 0);

  test('Get author name by first language', ()
  {
    expect(TitleParser().parseFirstLangugaeTitle(author.name), 'அருளானந்தம்');
  });

  test('Get author name by second language', ()
  {
    expect(TitleParser().parseSecondLangugaeTitle(author.name), 'Arulanantham ');
  });
}

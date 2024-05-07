import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/parser/VerseParser.dart';

void main() {
  String lyric = "{y}அக்கினி அபிஷேகம்{/y}\n Akkini abishegam\n {y}பொழிந்திடுவீர் தேவா{/y}\n Pozhinthiduveer Thevaa";
  VerseParser parser = VerseParser();

  test('Parse song', ()
  {
    expect(parser.formatVerse(lyric), "<lang1>அக்கினி அபிஷேகம்<\/lang1>\n Akkini abishegam\n <lang1>பொழிந்திடுவீர் தேவா<\/lang1>\n Pozhinthiduveer Thevaa");
  });

  test('Show only first language', ()
  {
    expect(parser.showOnlyFirstLanguage(lyric), "\n Akkini abishegam\n \n Pozhinthiduveer Thevaa");
  });

  test('Show only second language', ()
  {
    expect(parser.showOnlySecondLanguage(lyric), "<lang1>அக்கினி அபிஷேகம்<\/lang1>\n<lang1>பொழிந்திடுவீர் தேவா<\/lang1>\n");
  });
}
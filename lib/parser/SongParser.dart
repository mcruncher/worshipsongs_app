import 'package:xml/xml.dart' as xml;
import '../domain/Song.dart';
import 'VerseParser.dart';

class SongParser {
  List<String> parseSong(Song song, bool showFirstLanguage, bool showSecondLanguage) {
    List<String> verseList = [];
    final document = xml.XmlDocument.parse(song.lyrics);
    final songNode = document.findElements('song');
    if (songNode.isNotEmpty) {
      final lyricNode = songNode.first.findElements('lyrics');
      if (lyricNode.isNotEmpty) {
        final verses = lyricNode.first.findElements('verse');
        for (final verse in verses) {
          verseList.add(VerseParser().verse(verse.innerText, showFirstLanguage, showSecondLanguage));
        }
      }
    } else {
      verseList.add(song.lyrics);
    }
    return verseList;
  }

}
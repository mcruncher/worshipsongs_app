import 'package:xml/xml.dart' as xml;

import '../domain/Song.dart';
import 'VerseParser.dart';

class SongLyricsParser {
  List<String> parse(Song song) {
    List<String> verseList = [];
    final document = xml.XmlDocument.parse(song.lyrics);
    final songNode = document.findElements('song');
    if (songNode.isNotEmpty) {
      final lyricNode = songNode.first.findElements('lyrics');
      if (lyricNode.isNotEmpty) {
        final verses = lyricNode.first.findElements('verse');
        var verseParser = VerseParser();
        for (final verse in verses) {
          verseList.add(verseParser.parse(verse.innerText));
        }
      }
    } else {
      verseList.add(song.lyrics);
    }
    return verseList;
  }

}
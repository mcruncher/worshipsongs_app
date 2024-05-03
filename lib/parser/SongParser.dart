import 'package:xml/xml.dart' as xml;
import '../domain/Song.dart';
import 'VerseParser.dart';

class SongParser {
  List<String> parseSong(Song song) {
    List<String> verseList = [];
    final document = xml.XmlDocument.parse(song.lyrics);
    final songNode = document.findElements('song');
    if (songNode.isNotEmpty) {
      final lyricNode = songNode.first.findElements('lyrics');
      if (lyricNode.isNotEmpty) {
        final verses = lyricNode.first.findElements('verse');
        for (final verse in verses) {
          verseList.add(VerseParser().verse(verse.innerText));
        }
      }
    } else {
      verseList.add(song.lyrics);
    }
    return verseList;
  }

  String formatVerse(String verse) {
    return verse.replaceAll(RegExp('\\{\\w\\}'), '<lang1>')
        .replaceAll(RegExp('\\{/\\w\\}'), '</lang1>');
  }


}
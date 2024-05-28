class VerseParser {

  String verse(String verse, bool showFirstLanguage, bool showSecondLanguage) {
    if (showFirstLanguage && showSecondLanguage) {
      return formatVerse(verse);
    } else if(showSecondLanguage) {
      return showOnlySecondLanguage(verse);
    } if(showFirstLanguage) {
      return showOnlyFirstLanguage(verse);
    } else {
      return showOnlyFirstLanguage(verse);
    }
  }

  String showOnlySecondLanguage(String verse) {
    RegExp exp = RegExp('\\{\\w\\}(.*?|\n)*?\\{/\\w\\}');
    Iterable<Match> matches = exp.allMatches(verse);
    String matchingString = "";
    for (final Match m in matches) {
      for (var i = 0; i < m.groupCount; i++) {
        matchingString = "$matchingString${m[i]!}\n";
      }
    }
    if(matchingString.isEmpty)
      {
        return showOnlyFirstLanguage(verse);
      } else
        {
          return formatVerse(matchingString);
        }
  }

  String showOnlyFirstLanguage(String verse) {
    return verse.replaceAll(RegExp('\\{\\w\\}(.*?|\n)*?\\{/\\w\\}'), '');
  }

  String formatVerse(String verse) {
    return verse.replaceAll(RegExp('\\{\\w\\}'), '<lang1>')
        .replaceAll(RegExp('\\{/\\w\\}'), '</lang1>');
  }
}
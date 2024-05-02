class AuthorService
{
  String parseTamilName(String authorName)
  {
    if(authorName.contains("{"))
      {
        return authorName.split('{')[1].replaceAll('}', '');
      } else {
      return authorName;
    }
  }

  String parseEnglishName(String authorName)
  {
    if(authorName.contains("{")) {
      return authorName.split('{')[0];
    } else {
      return authorName;
    }
  }

}
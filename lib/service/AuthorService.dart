class AuthorService
{
  String authorNameByLanguage(String authorName) {
    if(authorName.contains('{')) {
      return authorName.split('{')[0];
    } else{
      return authorName;
    }
  }
}
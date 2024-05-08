class TitleParser
{
  String parseFirstLangugaeTitle(String name)
  {
    if(name.contains("{"))
      {
        return name.split('{')[1].replaceAll('}', '');
      } else {
      return name;
    }
  }

  String parseSecondLangugaeTitle(String name)
  {
    if(name.contains("{")) {
      return name.split('{')[0];
    } else {
      return name;
    }
  }

}
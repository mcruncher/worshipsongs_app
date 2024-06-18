import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/Topic.dart';
import 'package:worshipsongs_app/parser/TitleParser.dart';

void main(){
  Topic topic = new Topic(id:1, name: "Discipleship {சீஷத்துவம்}", songs: 54);

  test('Get topic name', ()
  {
    expect(topic.name, 'Discipleship {சீஷத்துவம்}');
  });

  test('Get topic tamil name', ()
  {
    expect(TitleParser().parseTitleByLanguage(topic.name), 'Discipleship ');
  });

  test('Get song count by topic', ()
  {
    expect(topic.songs, 54);
  });

}
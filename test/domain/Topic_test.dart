import 'package:flutter_test/flutter_test.dart';
import 'package:worshipsongs_app/domain/Topic.dart';

void main(){
  Topic topic = new Topic(name: "Discipleship {சீஷத்துவம்}", tamilName: "சீஷத்துவம்", defaultName: "Discipleship", songs: 40);

  test('Get topic name', ()
  {
    expect(topic.defaultName, 'Discipleship');
  });

  test('Get topic tamil name', ()
  {
    expect(topic.tamilName, 'சீஷத்துவம்');
  });

  test('Get song count by topic', ()
  {
    expect(topic.songs, 40);
  });

}
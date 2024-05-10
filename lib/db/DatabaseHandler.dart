import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:path/path.dart' show dirname, join, url;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/domain/Topic.dart';

import '../domain/Song.dart';

class DatabaseHandler{
  Future<Database> initializedDB() async {
    if(kIsWeb)
      {
        sqfliteFfiInit();
        databaseFactory = databaseFactoryFfiWeb;
      }
    if(Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    } else {
      print('OS: ${Platform.operatingSystem}');
    }
    String databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "songs.sqlite");
    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset");
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(url.join("resources/assets", "songs.sqlite"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    return await openDatabase(path, readOnly: true);
  }

  // Future<List<Map>> retrieveAttributes(String query, String attribute) async {
  //   final Database db = await initializedDB();
  //   final List<Map> maps = await db.rawQuery(query);
  //   return maps;
  // }

  Future<List<Song>> findAllSongs() async {
    Database database = await initializedDB();
    List response = await database.query("songs");
    List<Song> list = response.map((c) => Song.fromMap(c)).toList();
    return list;
  }

  Future<List<Author>> findAuthors() async {
    Database database = await initializedDB();
    List response = await database.rawQuery("select a.display_name, count(auths.song_id) as songs from authors a, authors_songs auths where auths.author_id = a.id group by a.display_name");
    List<Author> list = response.map((c) => Author.fromMap(c)).toList();
    return list;
  }

  Future<List<Topic>> findTopics() async {
    Database database = await initializedDB();
    List response = await database.rawQuery("select topic.id, topic.name as name, count(topic.id) as songs from songs as song, songs_topics as songtopics, topics as topic where songtopics.song_id=song.id  and topic.id=songtopics.topic_id group by topic.name");
    List<Topic> list = response.map((c) => Topic.fromMap(c)).toList();
    return list;
  }
}
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' show dirname, join, url;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHandler{
  Future<Database> initializedDB() async {
    print('OS: ${Platform.operatingSystem}');
    if(Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    String databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "songs.sqlite");
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(url.join("assets", "songs.sqlite"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    return await openDatabase(path, readOnly: true);
  }

  Future<List<Map>> retrieveAttributes(String query, String attribute) async {
    final Database db = await initializedDB();
    final List<Map> maps = await db.rawQuery(query);
    return maps;
  }

   Future<String> lyricsByTitle(String title) async {
     final Database db = await initializedDB();
     final List<Map> lyrics = await db.rawQuery('select lyrics from songs where title = "$title"');
       return lyrics[0]['lyrics'];
   }

  Future<List<String>> songsByAuthor(String display_name) async {
    final Database db = await initializedDB();
    final List<Map> lyrics = await db.rawQuery('SELECT s.title from authors a, songs s, authors_songs auths where a.id = auths.author_id and s.id = auths.song_id and a.display_name = "$display_name"');
    return List.generate(lyrics.length, (i) {
      return lyrics[i]['title'];
    });
  }
}

class Song {
  final int id;
  final String title;

  const Song({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  @override
  String toString() {
    return 'Song{id: $id, name: $title}';
  }
}
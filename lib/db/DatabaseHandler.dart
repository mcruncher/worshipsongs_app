import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:path/path.dart' show dirname, join, url;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import '../domain/Author.dart';
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
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(url.join("resources/assets", "songs.sqlite"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    return await openDatabase(path, readOnly: true);
  }

  Future<List<Map>> getSongs() async {
    final Database db = await initializedDB();
    return db.query("songs");
  }

  Future<List<Map>> retrieveAttributes(String query, String attribute) async {
    final Database db = await initializedDB();
    final List<Map> maps = await db.rawQuery(query);
    return maps;
  }

  Future<List<Song>> findAllSongs() async {
    Database database = await initializedDB();
    var response = await database.query("songs");
    List<Song> list = response.map((c) => Song.fromMap(c)).toList();
    return list;
  }

  Future<List<Author>> findAllAuthors() async {
    Database database = await initializedDB();
    var response = await database.query("authors");
    List<Author> list = response.map((c) => Author.fromMap(c)).toList();
    return list;
  }
}
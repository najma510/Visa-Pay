import 'dart:async';
import 'dart:io' as io;
import 'package:VisaPay/database/pageClass.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String Page = 'page';
  static const String TABLE = 'pageChecker';
  static const String DB_NAME = 'pageChecker1.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);

    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY,$Page INTEGER )");
  }

  Future<int> save(PageChecker pageChecker) async {
    var dbClient = await db;
    pageChecker.id = await dbClient.insert(TABLE, pageChecker.toMap());
    return pageChecker.id;
  }

  Future<List<PageChecker>> getPageCheckers() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID,Page]);

    List<PageChecker> pageCheckers = [];

    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        pageCheckers.add(PageChecker.fromMap(maps[i]));
      }
    }
    return pageCheckers;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;

    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(PageChecker pageChecker) async {
    var dbClient = await db;

    return await dbClient.update(TABLE, pageChecker.toMap(),
        where: '$ID = ?', whereArgs: [pageChecker.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}

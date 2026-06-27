import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final _kLogName = "DB-BOOKMARK-HELPER";

class DBBookmarkHelper {
  static final DBBookmarkHelper instance = DBBookmarkHelper._init();
  static Database? _database;

  DBBookmarkHelper._init();

  final String _filePath = 'bookmark.db';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<String> _getDBPath(String filePath) async {
    final _appDir = await getApplicationSupportDirectory();
    final path = join(_appDir.path, 'data', filePath);
    logD('Database Quran Bookmark path: $path', name: _kLogName);
    return path;
  }

  Future<Database> _initDB() async {
    String path = await _getDBPath(_filePath);

    bool exists = await databaseExists(path);
    if (!exists) {
      // Jika belum ada, salin dari folder assets
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
    }
    return await openDatabase(path, version: 1, onCreate: _createDB);
    // return await openDatabase(path, version: 4, onCreate: _createDB, onUpgrade: _upgradeDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE bookmarks (
        verseId INTEGER PRIMARY KEY,
        chapterId INTEGER,
        verseNo INTEGER,
        juz INTEGER,
        page INTEGER,
        createdAt INTEGER,
        notes TEXT,
        tags TEXT
      )
    ''');
  }

  // Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
  //   if (oldVersion < 2) {
  //     await db.execute('''
  //       ALTER TABLE bookmarks RENAME COLUMN note TO notes;
  //     ''');
  //   }
  //   if (oldVersion < 3) {
  //     await db.execute('''
  //       ALTER TABLE bookmarks RENAME COLUMN tag TO tags;
  //     ''');
  //   }
  //   if (oldVersion < 4) {
  //     await db.execute('''
  //       ALTER TABLE bookmarks DROP COLUMN id
  //       ;
  //     ''');
  //   }
  // }

  Future deleteDB() async {
    String path = await _getDBPath(_filePath);
    await deleteDatabase(path);
    logD('Database file deleted: $path', name: _kLogName);
  }

  // CREATE
  Future<int> create(Map<String, dynamic> data) async {
    final db = await instance.database;
    return await db.insert('bookmarks', data);
  }

  // READ ALL
  Future<List<Map<String, dynamic>>> read() async {
    final db = await instance.database;
    final result = await db.query('bookmarks', orderBy: 'createdAt DESC');
    // logD(result.toString(), name: _kLogName);
    return result;
  }

  // UPDATE
  Future<int> update(Map<String, dynamic> data) async {
    try {
      final db = await instance.database;
      return await db.update('bookmarks', data, where: 'verseId = ?', whereArgs: [data['verseId']]);
    } catch (e) {
      logE('Error updating:', error: e, name: _kLogName);
      rethrow;
    }
  }

  // DELETE
  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete('bookmarks', where: 'verseId = ?', whereArgs: [id]);
  }

  Future<List<String>> getTags() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT DISTINCT tags FROM bookmarks');
    // logD('result: $result', name: _kLogName);

    List<String> _result = [];
    for (var el in result) {
      List<String> _tags = List<String>.from(jsonDecode(el['tags'] as String) ?? []);
      _result.addAll(_tags);
    }
    // logD('_result: $_result', name: _kLogName);

    List<String> uniqueTags = _result.toSet().toList();
    uniqueTags.sort();
    // logD('uniqueTags: $uniqueTags', name: _kLogName);

    return uniqueTags;
  }

  Future<List<Map<String, dynamic>>> filterByTags(List<String> tags) async {
    final db = await instance.database;
    if (tags.isEmpty) {
      final result = await db.query('bookmarks', orderBy: 'createdAt DESC');
      return result;
    }

    List<String> conditions = tags.map((tag) => "tags LIKE '%$tag%'").toList();
    String whereClause = conditions.join(' OR ');
    final result = await db.rawQuery('SELECT * FROM bookmarks WHERE $whereClause');
    // logD('filterByTags: $result', name: _kLogName);

    return result;
  }

  Future<List<Map<String, dynamic>>> search(String searchTerm) async {
    final db = await instance.database;
    if (searchTerm.isEmpty) {
      return [];
    }

    List<String> _fields = ['notes', 'tags'];
    List<String> conditions = _fields.map((field) => "$field LIKE '%$searchTerm%'").toList();
    String whereClause = conditions.join(' OR ');
    final result = await db.rawQuery('SELECT * FROM bookmarks WHERE $whereClause');
    // logD('filterByTags: $result', name: _kLogName);

    return result;
  }

  // CLOSE DATABASE
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:sqflite/sqflite.dart';

final _kLogName = "DB-CHAT-SERVICE";

class DbChatService {
  static final DbChatService instance = DbChatService._init();
  static Database? _database;

  DbChatService._init();

  final String _filePath = 'chat.db';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<String> _getDBPath(String filePath) async {
    final _appDir = await getApplicationSupportDirectory();
    final path = join(_appDir.path, 'data', filePath);
    logD('Database Chat path: $path', name: _kLogName);
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
      CREATE TABLE chat_list (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
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
}
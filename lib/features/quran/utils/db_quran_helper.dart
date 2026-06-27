import 'package:path_provider/path_provider.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final _kLogName = "DB-QURAN-HELPER";

class DBQuranHelper {
  static DBQuranHelper instance = DBQuranHelper._init();
  static Database? _database;

  DBQuranHelper._init();

  final String _filePath = 'quran.db';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<String> _getDBPath(String filePath) async {
    final _appDir = await getApplicationSupportDirectory();
    final path = join(_appDir.path, 'data', filePath);
    logD('Database Quran path: $path', name: _kLogName);
    return path;
  }

  Future<Database> _initDB() async {
    String path = await _getDBPath(_filePath);

    // await deleteDB();

    // bool exists = await databaseExists(path);
    // if (!exists) {
    //   // Jika belum ada, salin dari folder assets
    //   try {
    //     await Directory(dirname(path)).create(recursive: true);
    //   } catch (_) {}

    //   // Membaca data file dari assets
    //   ByteData data = await rootBundle.load(join("assets/quran", "quran.db"));
    //   List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    //   // Menulis data ke file lokal di perangkat
    //   await File(path).writeAsBytes(bytes, flush: true);
    //   logD('Database Quran (not exists), and then created', name: _kLogName);
    // }

    // 3. Buka dan kembalikan koneksi database SQLite
    return await openDatabase(path);
  }

  Future deleteDB() async {
    String path = await _getDBPath(_filePath);
    await deleteDatabase(path);
    logD('Database file deleted: $path', name: _kLogName);
  }

  Future<List<Map<String, Object?>>> getChapters() async {
    final db = await database;
    final result = await db.query('chapters', orderBy: 'id ASC');
    return result;
  }

  Future<List<Map<String, Object?>>> getJuzs() async {
    final db = await database;
    final result = await db.query('juzs', orderBy: 'id ASC');
    return result;
  }

  Future<List<Map<String, Object?>>> getVerses({int? chapterId, int? juz, int? page}) async {
    final db = await database;
    if (chapterId != null) {
      final result = await db.rawQuery('SELECT * FROM verses WHERE chapterId = ? ORDER BY id', [chapterId]);
      return result;
    }
    if (juz != null) {
      final result = await db.rawQuery('SELECT * FROM verses WHERE juz = ? ORDER BY id', [juz]);
      return result;
    }
    if (page != null) {
      final result = await db.rawQuery('SELECT * FROM verses WHERE page = ? ORDER BY id', [page]);
      return result;
    }
    final result = await db.query('verses', orderBy: 'id ASC');
    return result;
  }

  Future<List<Map<String, dynamic>>> getPages() async {
    final db = await database;
    final result = await db.query('pages', orderBy: 'id ASC');
    return result;
  }

  Future<List<Map<String, dynamic>>> search(String searchTerm) async {
    final db = await database;
    if (searchTerm.isEmpty) {
      return [];
    }

    List<String> _fields = ['arabic', 'indo', 'latin'];
    List<String> conditions = _fields.map((field) => "$field LIKE '%$searchTerm%'").toList();
    String whereClause = conditions.join(' OR ');
    final result = await db.rawQuery('SELECT * FROM verses WHERE $whereClause');
    // logD('search count: ${result.length} affected', name: _kLogName);

    return result;
  }

  // CLOSE DATABASE
  Future close() async {
    final db = await database;
    db.close();
  }
}

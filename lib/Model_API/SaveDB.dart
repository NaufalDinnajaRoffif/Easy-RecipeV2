import 'package:easy_v3/Model_API/SaveModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SaveDB {
  static final SaveDB instance = SaveDB.init();
  static Database? _database;

  SaveDB.init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('Save.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''CREATE TABLE $tableSave (
   ${Save.id} $idType,
   ${Save.image} $textType,
   ${Save.time} $textType,
   ${Save.title} $textType,
   ${Save.difficulty} $textType)''');
  }

  Future<SaveModel> create(SaveModel recipes) async {
    final db = await instance.database;
    final id = await db.insert(tableSave, recipes.toJson());
    return recipes.copy(id: id);
  }

  Future<bool> read(String? title) async {
    final db = await instance.database;

    final maps = await db.query(
      tableSave,
      columns: Save.values,
      where: '${Save.title} = ?',
      whereArgs: [title],
    );
    if (maps.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<SaveModel>> readAll() async {
    final db = await instance.database;
    final result = await db.query(tableSave);
    return result.map((json) => SaveModel.fromJson(json)).toList();
  }

  delete(String? title) async {
    final db = await instance.database;
    try {
      await db
          .delete(tableSave, where: '${Save.title} = ?', whereArgs: [title]);
    } catch (e) {
      print(e);
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

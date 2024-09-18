import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/dhikr.dart';

class DatabaseHelper {
  static final _databaseName = "DhikrDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'dhikr_table';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnTarget = 'targetCount';
  static final columnCurrent = 'currentCount';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnTarget INTEGER NOT NULL,
            $columnCurrent INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Dhikr dhikr) async {
    Database db = await instance.database;
    return await db.insert(table, {
      columnName: dhikr.name,
      columnTarget: dhikr.targetCount,
      columnCurrent: dhikr.currentCount,
    });
  }

  Future<int> update(Dhikr dhikr) async {
    Database db = await instance.database;
    int id = dhikr.id!;
    return await db.update(table, dhikr.toMap(),
        where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Dhikr>> getAllDhikr() async {
    Database db = await instance.database;
    var res = await db.query(table);
    List<Dhikr> list = res.isNotEmpty ? res.map((c) => Dhikr.fromMap(c)).toList() : [];
    return list;
  }
}
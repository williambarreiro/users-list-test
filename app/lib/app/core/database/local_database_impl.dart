import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'local_database.dart';

class LocalDatabaseImpl implements LocalDatabase {
  static const _databaseName = 'TEST_APP_DATABASE';
  Database? _db;

  @override
  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databasePathFinal = join(databasePath, _databaseName);
    _db ??= await openDatabase(
      databasePathFinal,
      onCreate: onCreate,
      version: 1,
    );

    return _db!;
  }

  FutureOr<void> onCreate(Database db, int version) {
    return db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, age INTEGER)',
    );
  }
}

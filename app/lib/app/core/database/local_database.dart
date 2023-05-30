import 'package:sqflite/sqflite.dart';

abstract class LocalDatabase {
  Future<Database> openConnection();
}

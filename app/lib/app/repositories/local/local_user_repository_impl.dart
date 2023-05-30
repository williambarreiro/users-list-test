import 'package:sqflite/sqflite.dart';
import 'package:test_sodre/app/core/database/local_database.dart';
import 'package:test_sodre/app/models/user_model.dart';

import 'local_user_repository.dart';

class LocalUserRepositoryImpl implements LocalUserRepository {
  final LocalDatabase _database;

  LocalUserRepositoryImpl(this._database);

  @override
  Future<List<UserModel>> getUsers() async {
    final conn = await _database.openConnection();
    final List<Map<String, dynamic>> usersMaps = await conn.query('users');
    return List.generate(
      usersMaps.length,
      (i) {
        return UserModel(
          name: usersMaps[i]['name'],
          email: usersMaps[i]['email'],
          age: usersMaps[i]['age'],
        );
      },
    );
  }

  @override
  Future<void> saveUsers(List<UserModel> users) async {
    final conn = await _database.openConnection();
    await conn.delete('users');
    final batch = conn.batch();

    for (final user in users) {
      batch.insert(
        'users',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
  }
}

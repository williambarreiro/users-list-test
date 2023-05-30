import 'dart:developer';

import 'package:test_sodre/app/models/user_model.dart';

import '../../core/rest_client/rest_client.dart';
import 'remote_user_repository.dart';

class RemoteUserRepositoryImpl implements RemoteUserRepository {
  final RestClient _restClient;

  RemoteUserRepositoryImpl(this._restClient);

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final result = await _restClient.get('/users');
      final resultList = result as List<dynamic>;
      final users = resultList.map((e) => UserModel.fromMap(e)).toList();
      return users;
    } on Exception catch (e, s) {
      log('Exception no getUsers do RemoteUserRepository',
          error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> registerUser(UserModel user) async {
    final body = {
      'name': user.name,
      'email': user.email,
      'age': user.age,
    };

    await _restClient.post('/users', data: body);
  }
}

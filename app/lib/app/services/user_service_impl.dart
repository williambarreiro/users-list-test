import 'dart:developer';

import 'package:test_sodre/app/models/user_model.dart';
import 'package:test_sodre/app/repositories/remote/remote_user_repository.dart';

import '../repositories/local/local_user_repository.dart';
import 'user_service.dart';

class UserServiceImpl implements UserService {
  final RemoteUserRepository _remoteRepository;
  final LocalUserRepository _localRepository;

  UserServiceImpl({
    required RemoteUserRepository remoteRepository,
    required LocalUserRepository localRepository,
  })  : _remoteRepository = remoteRepository,
        _localRepository = localRepository;

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final users = await _remoteRepository.getUsers();
      await _localRepository.saveUsers(users);
      return users;
    } catch (e) {
      log('Retornando dados locais');
      return await _localRepository.getUsers();
    }
  }

  @override
  Future<void> registerUser(UserModel user) =>
      _remoteRepository.registerUser(user);
}

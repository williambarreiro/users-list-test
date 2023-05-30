import 'package:test_sodre/app/models/user_model.dart';
import 'package:test_sodre/app/repositories/remote/remote_user_repository.dart';

import 'user_service.dart';

class UserServiceImpl implements UserService {
  final RemoteUserRepository _remoteRepository;

  UserServiceImpl(this._remoteRepository);

  @override
  Future<List<UserModel>> getUsers() => _remoteRepository.getUsers();

  @override
  Future<void> registerUser(UserModel user) =>
      _remoteRepository.registerUser(user);
}

import 'package:test_sodre/app/models/user_model.dart';

abstract class RemoteUserRepository {
  Future<List<UserModel>> getUsers();
  Future<void> registerUser(UserModel user);
}

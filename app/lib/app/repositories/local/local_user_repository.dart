import '../../models/user_model.dart';

abstract class LocalUserRepository {
  Future<List<UserModel>> getUsers();
  Future<void> saveUsers(List<UserModel> users);
}

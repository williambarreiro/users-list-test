import '../models/user_model.dart';

abstract class UserService {
  Future<List<UserModel>> getUsers();
  Future<void> registerUser(UserModel user);
}

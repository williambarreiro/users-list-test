part of 'user_list_controller.dart';

@immutable
abstract class UserListState {}

class Success extends UserListState {
  final List<UserModel> users;

  Success({required this.users});
}

class Failure extends UserListState {}

class Loading extends UserListState {}

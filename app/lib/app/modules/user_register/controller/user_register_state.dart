part of 'user_register_controller.dart';

@immutable
abstract class UserRegisterState {}

class Initial extends UserRegisterState {}

class Failure extends UserRegisterState {}

class Loading extends UserRegisterState {}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_sodre/app/models/user_model.dart';
import 'package:test_sodre/app/services/user_service.dart';

part 'user_list_state.dart';

class UserListController extends Cubit<UserListState> {
  final UserService _userService;

  UserListController(this._userService) : super(Loading());

  Future<void> loadUsers() async {
    try {
      emit(Loading());
      // Delay apenas para mostrar o loading
      await Future.delayed(const Duration(seconds: 1));
      final users = await _userService.getUsers();
      emit(Success(users: users));
    } catch (e, s) {
      log('Exception no loadUsers do UserListController',
          error: e, stackTrace: s);
      emit(Failure());
    }
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';

import '../../../models/user_model.dart';
import '../../../services/user_service.dart';

part 'user_register_state.dart';

class UserRegisterController extends Cubit<UserRegisterState> {
  final UserService _userService;

  UserRegisterController(this._userService) : super(Initial());

  Future<void> registerUser(UserModel user) async {
    try {
      emit(Loading());
      // Delay apenas para mostrar o loading
      await Future.delayed(const Duration(seconds: 1));
      await _userService.registerUser(user);
      Modular.to.pop();
    } catch (e, s) {
      log('Exception no registerUser do UserRegisterController',
          error: e, stackTrace: s);
      emit(Failure());
    }
  }
}

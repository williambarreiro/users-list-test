import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_sodre/app/modules/user_list/user_list_module.dart';
import 'package:test_sodre/app/modules/user_register/user_register_module.dart';

import 'core/constants.dart';
import 'core/environments.dart';
import 'core/rest_client/dio_rest_client.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => Dio(
            BaseOptions(
              baseUrl: Environments.param(Constants.envBaseUrlKey) ?? '',
            ),
          ),
        ),
        Bind.lazySingleton((i) => DioRestClient(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/user_list', module: UserListModule()),
        ModuleRoute('/user_register', module: UserRegisterModule()),
      ];
}

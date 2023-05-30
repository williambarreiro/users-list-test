import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_sodre/app/core/database/local_database_impl.dart';
import 'package:test_sodre/app/modules/user_list/user_list_module.dart';
import 'package:test_sodre/app/modules/user_register/user_register_module.dart';
import 'package:test_sodre/app/repositories/remote/remote_user_repository_impl.dart';

import 'core/constants.dart';
import 'core/environments.dart';
import 'core/rest_client/dio_rest_client.dart';
import 'repositories/local/local_user_repository_impl.dart';
import 'services/user_service_impl.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => Dio(
            BaseOptions(
              baseUrl: Environments.param(Constants.envBaseUrlKey) ?? '',
              connectTimeout: const Duration(seconds: 10),
            ),
          ),
        ),
        Bind.lazySingleton((i) => DioRestClient(i())),
        Bind.lazySingleton((i) => RemoteUserRepositoryImpl(i())),
        Bind.lazySingleton((i) => LocalDatabaseImpl()),
        Bind.lazySingleton((i) => LocalUserRepositoryImpl(i())),
        Bind.lazySingleton((i) => UserServiceImpl(
              remoteRepository: i(),
              localRepository: i(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/user_list', module: UserListModule()),
        ModuleRoute('/user_register', module: UserRegisterModule()),
      ];
}

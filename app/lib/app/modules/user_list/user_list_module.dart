import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_sodre/app/modules/user_list/user_list_page.dart';

class UserListModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const UserListPage(),
        ),
      ];
}

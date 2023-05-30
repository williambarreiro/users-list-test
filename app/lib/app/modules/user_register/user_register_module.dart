import 'package:flutter_modular/flutter_modular.dart';

import 'user_register_page.dart';

class UserRegisterModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const UserRegisterPage(),
        ),
      ];
}

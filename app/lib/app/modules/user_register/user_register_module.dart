import 'package:flutter_modular/flutter_modular.dart';

import 'controller/user_register_controller.dart';
import 'user_register_page.dart';

class UserRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => UserRegisterController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => UserRegisterPage(controller: Modular.get()),
        ),
      ];
}

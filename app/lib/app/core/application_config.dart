import 'package:flutter/material.dart';

import 'environments.dart';

class ApplicationConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Environments.loadEnvs();
  }
}

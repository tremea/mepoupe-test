import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mepoupe_test/app/modules/home/pages/procurar.dart';
import 'package:mepoupe_test/app/modules/home/repository/home_interface.dart';

import 'modules/home/home_module.dart';
import 'modules/home/home_store.dart';
import 'modules/home/repository/home_repository.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),

  ];

}
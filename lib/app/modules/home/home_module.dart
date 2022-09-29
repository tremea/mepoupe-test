import 'package:dio/dio.dart';
import 'package:mepoupe_test/app//modules/home/home_page.dart';
import 'package:mepoupe_test/app//modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mepoupe_test/app/modules/home/pages/procurar.dart';
import 'package:mepoupe_test/app/modules/home/repository/home_interface.dart';
import 'package:mepoupe_test/app/modules/home/repository/home_repository.dart';

class HomeModule extends Module {

  @override
  final List<Bind> binds = [

    Bind.lazySingleton((i) => HomeStore()),
   // Bind.factory((i) => Dio()),
   // Bind.singleton<HomeInterface>((i) => HomeRepository()),


  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const HomePage()),
    ChildRoute('/', child: (_, args) => const HomePage()),
    ChildRoute('/procurar', child: (_, args) => ProcurarPage()),
  ];
}

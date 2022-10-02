import 'package:mepoupe_test/app//modules/procurar/procurar_Page.dart';
import 'package:mepoupe_test/app//modules/procurar/procurar_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProcurarModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProcurarStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProcurarPage()),
  ];
}

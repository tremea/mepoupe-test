import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

//await Hive.initFlutter();
//var box = await Hive.openBox('favoritos');

Future<void> main()   async {
  await Hive.initFlutter();

  var box = await Hive.openBox('favoritos');
  await Hive.openBox('pesquisados');


      runApp(ModularApp(module: AppModule(), child: AppWidget()));
    }

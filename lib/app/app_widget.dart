import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mepoupe_test/app/app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Slidy',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'MavenPro'),
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
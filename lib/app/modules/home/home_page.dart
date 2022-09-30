import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mepoupe_test/app//modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:mepoupe_test/app/app_colors.dart';
import 'package:mepoupe_test/app/modules/home/pages/favoritos.dart';
import 'package:mepoupe_test/app/modules/home/pages/inicio.dart';
import 'package:mepoupe_test/app/modules/home/pages/procurar.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  int? index;

  @override
  Widget build(BuildContext context) {

    final List<Widget> _widgetOptions = <Widget>[
      const InicioPage(),
      ProcurarPage(),
      const FavoritosPage(),

    ];
    return Observer(builder: (_) {
      return Scaffold(
    /*    appBar: AppBar(
          title: Text(widget.title),
        ),*/
        body: Observer(
          builder: (_) {
            return _widgetOptions.elementAt(store.selectedIndex);
          },
        ),
        bottomNavigationBar: Observer(
          builder: (_) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              // ignore: prefer_const_literals_to_create_immutables
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(

                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Procurar',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.star_border),
                  label: 'Favoritos',
                ),
              ],
              currentIndex: store.selectedIndex,

              selectedItemColor: AppColors.defaultBlue,
              onTap: (int index) {

                  store.setIndex(index);



              },
            );
          },
        ),
      );
    });
  }
}

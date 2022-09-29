import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mepoupe_test/app/modules/home/widgets/widget_card_favorito.dart';

import '../home_store.dart';
import '../widgets/widget_title.dart';
class FavoritosPage extends StatefulWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {

  late final HomeStore store = Modular.get();

  @override
  void initState() {
    store.getItem();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return

      SingleChildScrollView(

        child:
        Container(
      padding: EdgeInsets.only(top: 80, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

                    Icon(Icons.star_border, color: Colors.blue, size: 60,),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(left: 0),
                      child: const wTitle(
                        texto: "Meus favoritos",
                        tamanho: 30,
                        negrito: true,
                        cor: Colors.blue,
                      ),),
                    const SizedBox(
                      height: 20,
                    ),




            SizedBox(height: 20,),


            ValueListenableBuilder(
              valueListenable: Hive.box('favoritos').listenable(),


              builder: (context, box, _) {
                var todos = box.values.toList().cast();


                return wCardFavorito(favoritos: todos,);
              },

            ),





          ],
        )));
  }
}

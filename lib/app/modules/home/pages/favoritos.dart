import 'package:flutter/material.dart';
import 'package:mepoupe_test/app/modules/home/widgets/widget_card_favorito.dart';

import '../widgets/widget_title.dart';
class FavoritosPage extends StatefulWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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

            const wCardFavorito(
              cep: "88080-145",
              rua: "Rua João Teste ",

            )

          ],
        ));
  }
}

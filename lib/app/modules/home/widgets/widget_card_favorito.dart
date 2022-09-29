import 'package:flutter/material.dart';
import 'package:mepoupe_test/app/modules/home/models/endereco.dart';

import '../home_store.dart';

class wCardFavorito extends StatelessWidget {
  final List<dynamic> favoritos;

   wCardFavorito({
    Key? key,

    required this.favoritos, required this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child:
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: favoritos.length,
          itemBuilder: (BuildContext context, int index) {
            return    Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                title: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    favoritos[index]['cep'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                contentPadding: EdgeInsets.all(10),
                subtitle: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    favoritos[index]['logradouro'].toString(),
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ),
                trailing: GestureDetector(
                  child: Icon(Icons.remove_circle),
                  onTap: onTapDelete()
                ),
              ),
            );
          },
        )


     );
  }
}

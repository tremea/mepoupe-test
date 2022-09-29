import 'package:flutter/material.dart';

import '../home_store.dart';

class wCardFavorito extends StatelessWidget {
  final String cep;
  final String rua;
  const wCardFavorito({
    Key? key,
    required this.cep,
    required this.rua,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            title: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                cep,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            contentPadding: EdgeInsets.all(10),
            subtitle: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                rua,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
            ),
            trailing: GestureDetector(
              child: Icon(Icons.remove_circle),
            ),
          ),
        ));
  }
}

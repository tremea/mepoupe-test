
import 'package:flutter/material.dart';


import '../home_store.dart';

class wTitle extends StatelessWidget {

  final String texto;
  final bool negrito;
  final double tamanho;
  final Color cor;
  const wTitle({
    Key? key,

    required this.texto,
    required this.negrito,
    required this.tamanho,
    required this.cor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(texto, style: TextStyle(color: cor, fontWeight: negrito ? FontWeight.bold : FontWeight.normal, fontSize: tamanho),)
    );
  }
}

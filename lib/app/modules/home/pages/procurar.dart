import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mepoupe_test/app/modules/home/home_store.dart';
import 'package:mepoupe_test/app/modules/home/widgets/widget_card_favorito.dart';
import 'package:masked_text_field/masked_text_field.dart';

import '../models/endereco.dart';
import '../widgets/widget_title.dart';

class ProcurarPage extends StatefulWidget {
  ProcurarPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<ProcurarPage> createState() => _ProcurarPageState();
}

class _ProcurarPageState extends State<ProcurarPage> {
  TextEditingController searchController = TextEditingController();

  late final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 100, left: 30, right: 30),
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 0),
                    child: const wTitle(
                      texto: "Procurar CEP",
                      tamanho: 30,
                      negrito: true,
                      cor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: wTitle(
                      texto: "Digite o CEP que você deseja procurar",
                      tamanho: 20,
                      negrito: true,
                      cor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0, bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      //mask: 'xxxxxxxx',
                      controller: searchController,
                      maxLength: 8,
                      //inputFormatters: [],
                      decoration: const InputDecoration(
                        hintMaxLines: 1,
                        counterText: '',
                        hintText: "Buscar...",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        border: InputBorder.none,
                      ),
                      onChanged: (String value) {
                        if (searchController.text.length == 8) {
                          log('BUSCANDOOOO');
                          //store.isLoading = true;
                          String cep = searchController.text;
                          store.getEndereco(cep);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.only(left: 30, top: 50),
            child: wTitle(
                texto: 'Endereço:',
                negrito: true,
                tamanho: 30,
                cor: Colors.blue),
          ),
          store.endereco == null
              ? Container()
              : Container(
            padding: EdgeInsets.only(left: 30, top: 10, right: 30),
            alignment: Alignment.center,
            child: wTitle(
                texto: store.endereco!.logradouro.toString() + ' - ' +
                    store.endereco!.localidade.toString() + ' - ' +
                    store.endereco!.uf.toString() + ' - ' +
                    store.endereco!.cep.toString(),
                negrito: false,
                tamanho: 20,
                cor: Colors.black),
          ),/*wCardFavorito(
                  cep: store.endereco!.cep.toString(),
                  rua: store.endereco!.logradouro.toString(),
                )*/
        ],
      ));
    });
  }
}

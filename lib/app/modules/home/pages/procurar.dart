import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:mepoupe_test/app/modules/home/home_store.dart';
import 'package:mepoupe_test/app/modules/home/models/local_storage_favorito.dart';
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
  TextEditingController controller = TextEditingController();



  @override
  void initState() {
    super.initState();
  }

  /*final db = Hive.box('favoritos');


  void addItem(String cep, Address endereco){
      db.put(cep, endereco.toJson());
  }

  void getItem(){

    print('>> ${Hive.box('favoritos').listenable()}');

  }
*/
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
          store.endereco == null
              ? Container()
              : store.isLoading
                  ? Text("Crregandi,,,")
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 30, top: 120),
                          child: wTitle(
                              texto: 'Endereço:',
                              negrito: true,
                              tamanho: 30,
                              cor: Colors.blue),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 30, top: 10, right: 30),
                          alignment: Alignment.center,
                          child: wTitle(
                              texto: store.endereco!.logradouro.toString() +
                                  ' - ' +
                                  store.endereco!.localidade.toString() +
                                  ' - ' +
                                  store.endereco!.uf.toString() +
                                  ' - ' +
                                  store.endereco!.cep.toString(),
                              negrito: false,
                              tamanho: 20,
                              cor: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: ElevatedButton(
                              onPressed: () {

                                store.addItem(store.endereco!.cep.toString(), store.endereco!);
                                store.getItem();

                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          side:
                                              BorderSide(color: Colors.blue)))),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    left: 10, right: 20, top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.favorite_border),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    wTitle(
                                        texto: 'Adicionar aos Favoritos',
                                        negrito: false,
                                        tamanho: 20,
                                        cor: Colors.white),
                                  ],
                                ),
                              )),
                        ),

                        ValueListenableBuilder(
                            valueListenable: Hive.box('favoritos').listenable(),
                            builder: (context, box, _) {
                              var todos = box.values.toList().cast();


                              return Text(todos.toString());
                            },
                          ),




                      ],
                    ),

          /*wCardFavorito(
                  cep: store.endereco!.cep.toString(),
                  rua: store.endereco!.logradouro.toString(),
                )*/
        ],
      ));
    });
  }
}

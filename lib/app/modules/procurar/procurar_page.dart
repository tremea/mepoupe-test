import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mepoupe_test/app/modules/procurar/procurar_store.dart';
import 'package:mepoupe_test/app/shared/app_colors.dart';

import 'package:mepoupe_test/app/modules/home/home_store.dart';

import '../../shared/widgets/widget_title.dart';




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

  TextEditingController searchController = TextEditingController();

  late final ProcurarStore store = Modular.get();
  bool btHabilitado = true;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SingleChildScrollView(
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 100, left: 30, right: 30),
                      color: AppColors.defaultBlue,
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
                              enabled: btHabilitado,
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
                              onChanged: (String value) async {
                                if (searchController.text.length == 8) {
                                  String cep = searchController.text;
                                  await store.getEndereco(cep);


                                  if(store.endereco!.cep != null) {
                                    store.addPesquisado(
                                      //store.endereco!.cep.toString(),
                                        store.endereco!);
                                  }
                                  store.getItemPesquisado();


                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                  store.endereco == null //|| store.endereco!.cep == null
                      ? Container()
                      : store.isLoading
                      ? Container(
                      padding: EdgeInsets.only(top: 80),
                      child: Center(
                        child: CircularProgressIndicator(
                            color: AppColors.defaultBlue),
                      ))
                      : store.endereco!.cep == null
                      ? Container(
                      padding: EdgeInsets.only(top: 80),
                      child: Center(
                          child: wTitle(
                              texto: 'Não conseguimos localizar seu endereço, verifique se as informações passadas estão corretas',
                              negrito: true,
                              tamanho: 20,
                              cor: AppColors.defaultBlue)))
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
                            cor: AppColors.defaultBlue),
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

                              try{
                                store.addItem(
                                    store.endereco!.cep.toString(),
                                    store.endereco!);
                                store.getItem();
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.green,
                                  duration: const Duration(seconds: 3),
                                  content: const Text('CEP adicionado aos favoritos'),
                                  action: SnackBarAction(
                                    label: '',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);


                              }catch(
                              e
                              ){

                                final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  duration: const Duration(seconds: 3),
                                  content: const Text('Erro ao adicionar CEP aos favoritos'),
                                  action: SnackBarAction(
                                    label: '',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }




                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStatePropertyAll<Color>(
                                    AppColors.defaultBlue),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25.0),
                                        side: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                            AppColors.defaultBlue)))),
                            child: Container(
                              alignment: Alignment.center,
                              color: AppColors.defaultBlue,
                              padding: EdgeInsets.only(
                                  left: 10,
                                  right: 20,
                                  top: 10,
                                  bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.favorite_border),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(child: wTitle(
                                      texto: 'Adicionar aos Favoritos',
                                      negrito: false,
                                      tamanho: 20,
                                      cor: Colors.white),)
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),


                ],
              )));
    });
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mepoupe_test/app/modules/home/pages/historico_pesquisados.dart';
import 'package:mepoupe_test/app/modules/home/widgets/widget_title.dart';
import 'package:mepoupe_test/app/app_colors.dart';
import '../home_page.dart';
import '../home_store.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}


class _InicioPageState extends State<InicioPage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return
      Observer(
          builder: (_) {
            return SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const wTitle(
                        texto: "Olá,",
                        tamanho: 30,
                        negrito: false,
                        cor: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const wTitle(
                        texto: "Bem-vindo",
                        tamanho: 30,
                        negrito: true,
                        cor: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/capa.png',
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 3.6,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(70),
                          decoration: const BoxDecoration(
                            color: AppColors.defaultBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.pin_drop,
                                  size: 50,
                                  color: Colors.grey[200],
                                ),
                              ),
                              SizedBox(height: 10,),
                              wTitle(
                                texto: store.getqtdPesquisado().toString(),
                                tamanho: 30,
                                negrito: true,
                                cor: Colors.white,
                              ),
                              SizedBox(height: 10,),
                              wTitle(
                                texto: "CEPs pesquisados",
                                tamanho: 20,
                                negrito: false,
                                cor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const HistoricoPage(

                                ),
                              ));
                        },
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100.0),
                              topRight: Radius.circular(100.0),
                              bottomLeft: Radius.circular(100.0),
                              bottomRight: Radius.circular(100.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.save_rounded,
                                  size: 20,
                                  color: AppColors.defaultBlue,
                                ),
                              ),
                              Expanded(child: Container(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: const wTitle(
                                  texto: "CEPs salvos",
                                  tamanho: 16,
                                  negrito: true,
                                  cor: AppColors.defaultBlue,
                                ),
                              ),),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: AppColors.defaultBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(store.getQtdFavoritos().toString(),
                                  style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {

                          store.setIndex(2);


                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            );
          });
  }
}
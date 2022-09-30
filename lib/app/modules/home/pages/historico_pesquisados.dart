import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mepoupe_test/app/app_colors.dart';
import 'package:mepoupe_test/app/modules/home/widgets/widget_card_favorito.dart';

import '../home_store.dart';
import '../widgets/widget_card_historico.dart';
import '../widgets/widget_title.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  late final HomeStore store = Modular.get();

  @override
  void initState() {

    store.getqtdPesquisado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: SingleChildScrollView(

          child: Container(

              color: AppColors.lightBlue,
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  children: [
                  Icon(
                    Icons.history,
                    color: AppColors.defaultBlue,
                    size: 60,
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    child:   Icon(
                      Icons.clear,
                      color: AppColors.defaultBlue,
                      size: 30,
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    }
                  )
                    ]
                ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 0),
                    child: const wTitle(
                      texto: "Histórico",
                      tamanho: 30,
                      negrito: true,
                      cor: AppColors.defaultBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ValueListenableBuilder(
                    valueListenable: Hive.box('pesquisados').listenable(),
                    builder: (context, box, _) {
                      var todos = box.values.toList().cast();

                      return wCardHistorico(
                        pesquisados: todos,
                      );
                    },
                  ),
                ],
              ))),
    );
  }
}

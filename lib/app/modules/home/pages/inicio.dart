import 'package:flutter/material.dart';
import 'package:mepoupe_test/app/modules/home/widgets/widget_title.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height:50,
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
                  'assets/images/cep.png',
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(70),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.pin_drop,
                        size: 60,
                        color: Colors.grey[200],
                      ),
                    ),
                    wTitle(
                      texto: "525",
                      tamanho: 50,
                      negrito: true,
                      cor: Colors.white,
                    ),
                    wTitle(
                      texto: "CEPs pesquisados",
                      tamanho: 30,
                      negrito: false,
                      cor: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                decoration:  BoxDecoration(
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
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(child:   Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: const wTitle(
                        texto: "CEPs salvos",
                        tamanho: 16,
                        negrito: true,
                        cor: Colors.blue,
                      ),
                    ),),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Text('1', style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}

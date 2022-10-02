import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mepoupe_test/app/modules/procurar/repository/procurar_repository.dart';
import 'package:mobx/mobx.dart';

import '../home/models/endereco.dart';

part 'procurar_store.g.dart';

class ProcurarStore = _ProcurarStoreBase with _$ProcurarStore;
abstract class _ProcurarStoreBase with Store {

  late final ProcurarRepository _repository = ProcurarRepository();

  @observable
  bool isLoading = false;

  @observable
  Address? endereco;

  @action
  Future<void> getEndereco(String cep) async {
    isLoading = true;
    endereco = await _repository.getEndereco(cep).asObservable() as Address;
    isLoading = false;
  }



  final db = Hive.box('favoritos');
  final cepPesquisado = Hive.box('pesquisados');

  void addItem(String cep, Address endereco) {
    db.put(cep, endereco.toJson());
  }

  @observable
  ValueListenable? listaFavoritos;
  ValueListenable? listaPesquisados;

  void removeItem(String cep) {
    db.delete(cep);
  }

  int getQtdFavoritos() {
    return Hive.box('favoritos').length;
  }

  @observable
  int? qtdPesquisado;

  int? getqtdPesquisado() {
    return Hive.box('pesquisados').length;
  }

  void addPesquisado(Address endereco) {
    log("add pesquisado");
    cepPesquisado.put(DateTime.now().toString(), endereco.toJson());
  }

  void removeItemPesquisado(int index) {
    cepPesquisado.deleteAt(index);
  }

  void getItem() {
    listaFavoritos = Hive.box('favoritos').listenable();
    Hive.box('favoritos').length;
  }

  void getItemPesquisado() {
    listaPesquisados = Hive.box('pesquisados').listenable();
  }

}


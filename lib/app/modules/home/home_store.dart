import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mepoupe_test/app/modules/home/repository/home_interface.dart';
import 'package:mepoupe_test/app/modules/home/repository/home_repository.dart';
import 'package:mobx/mobx.dart';

import 'models/endereco.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  late final HomeRepository _repository = HomeRepository();

  @observable
  int selectedIndex = 0;

  @action
  void setIndex(int value) {
    selectedIndex = value;
  }

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

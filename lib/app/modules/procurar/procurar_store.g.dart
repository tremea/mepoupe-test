// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procurar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProcurarStore on _ProcurarStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ProcurarStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$enderecoAtom =
      Atom(name: '_ProcurarStoreBase.endereco', context: context);

  @override
  Address? get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(Address? value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  late final _$getEnderecoAsyncAction =
      AsyncAction('_ProcurarStoreBase.getEndereco', context: context);

  @override
  Future<void> getEndereco(String cep) {
    return _$getEnderecoAsyncAction.run(() => super.getEndereco(cep));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
endereco: ${endereco}
    ''';
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/endereco.dart';

class HomeRepository {
  @override
  Future<Address?> getEndereco(String cep) async {
    log('Buscando CEP');
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        "https://viacep.com.br/ws/$cep/json",
      );

      log('Retorno\n ${json.encode(response.data)}');

      return Address.fromJson(response.data);


    } on DioError catch (e, s) {
      if (e.response != null) {
        log('Erro', error: e, stackTrace: s);
        throw e.response!.data['message'];
      }
      throw 'Erro';
    } catch (e, s) {
      log('Erro', error: e, stackTrace: s);
      throw 'Erro';
    }
  }
}

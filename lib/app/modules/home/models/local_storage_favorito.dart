import 'package:mepoupe_test/app/modules/home/models/endereco.dart';

class LocalStorageFavorito {
  String title;
  int qtidade;
  Address? endereco;
  bool done;

  LocalStorageFavorito({required this.title, required this.qtidade,  this.endereco, required this.done});

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['title'] = title;
    m['qtidade'] = qtidade;
    m['done'] = done;
    m['endereco'] = endereco;

    return m;
  }
}

class LocalStorageFavoritoList {
  List<LocalStorageFavorito> items = [];

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}
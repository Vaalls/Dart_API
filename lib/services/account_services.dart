import 'dart:async';
import 'dart:convert';

import 'package:dart_assincronismo/api.dart';
import 'package:http/http.dart';

class AccountService {
  final StreamController<String> _streamController = StreamController<String>();
  Stream<String> get streamInfos => _streamController.stream;
  String url =
      "https://gist.githubusercontent.com/Vaalls/7c1c19cba87f199ab0cbe3bfcd87f1b0/raw/5fdd0d7c1ec75380c8a0bdb6c60cbcd8aa51f953/accounts.json";

  // Conectando nossa aplicação a web
  Future<List<dynamic>> getAll() async {
    Response response = await get(Uri.parse(url));
    _streamController.add("${DateTime.now()} | Requisição de leitura.");
    return json.decode(response.body);
  }

  addAccount(Map<String, dynamic> mapAccount) async {
    List<dynamic> listAccount = await getAll();
    listAccount.add(mapAccount);
    String content = jsonEncode(listAccount);

    Response response = await post(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $gitHubdApiKey"},
      body: json.encode({
        "description": "account.json",
        "public": true,
        "files": {
          "accounts.json": {
            "content": content,
          }
        }
      }),
    );

    if (response.statusCode.toString()[0] == "2") {
      _streamController.add(
          "${DateTime.now()} | Requisição de adição bem sucedida (${mapAccount["name"]}).");
    } else {
      _streamController.add(
          "${DateTime.now()} | Requisição de adição falhou (${mapAccount["name"]}).");
    }
  }
}

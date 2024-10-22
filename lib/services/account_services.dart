import 'dart:async';

import 'dart:convert';
import 'package:dart_assincronismo/api.dart';
import 'package:dart_assincronismo/models/account.dart';
import 'package:http/http.dart';

class AccountService {
  final StreamController<String> _streamController = StreamController<String>();
  Stream<String> get streamInfos => _streamController.stream;

  String url = "https://api.github.com.br/gists/7c1c19cba87f199ab0cbe3bfcd87f1b0";

  Future<List<Account>> getAll() async {
    try {
  Response response = await get(Uri.parse(url));
  _streamController.add("${DateTime.now()} | Requisição de leitura.");
  
  Map<String, dynamic> mapResponse = json.decode(response.body);
  List<dynamic> listDynamic = 
      json.decode(mapResponse["files"]["accounts.json"]["content"]); 
  
  List<Account> listAccounts = [];
  
  for (dynamic dyn in listDynamic) {
    Map<String, dynamic> mapAccount = dyn as Map<String, dynamic>;
    Account account = Account.fromMap(mapAccount);
    listAccounts.add(account); 
  }
  
  return listAccounts;
} on Exception {
  print("Se eu capturei a exceção no serviço, será lançada para tela?");
  return [];
}
  }

  addAccount(Account account) async {
    List<Account> listAccount = await getAll();
    listAccount.add(account);

    List<Map<String, dynamic>> listContent = [];
    for (Account account in listAccount) {
      listContent.add(account.toMap());
    } 

    String content = json.encode(listContent);

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
          "${DateTime.now()} | Requisição de adição bem sucedida (${account.name}).");
    } else {
      _streamController.add(
          "${DateTime.now()} | Requisição de adição falhou (${account.name}).");
    }
  }
}

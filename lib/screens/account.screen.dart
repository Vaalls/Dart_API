import 'dart:io';

import 'package:dart_assincronismo/models/account.dart';
import 'package:dart_assincronismo/services/account_services.dart';
import 'package:http/http.dart';

class AccountScreen {
  AccountService _accountService = AccountService();

  void initializeStream() {
    _accountService.streamInfos.listen(
      (event) {
        print(event);
      },
    );
  }

  void runChatBot() async{
    print("Bom dia! Eu sou o Lewis, assistente do Banco d'Ouro!");
    print("Que bom te ter aqui com a gente.\n");

    bool isRunnig = true;
    while (isRunnig) {
      print("Como eu posso te ajudar? (digite o número desejado)");
      print("1 - 👀 Ver todas sua contas.");
      print("2 - ➕ Adicionar nova conta.");
      print("3 - Sair\n");

      String? input = stdin.readLineSync();

      if (input != null) {
        switch (input) {
          case "1":
            {
              await _getAllAccounts();
              break;
            }
          case "2":
            {
              await _addExampleAccount();
              break;
            }
          case "3":
            {
              isRunnig = false;
              print("Te vejo na próxima. 👋");
              break;
            }
          default: 
            {
              print("Não entendi. Tente novamente!");
            }
        }
      }
    }
  }

  _getAllAccounts() async{
    try{
      List<Account> listAccount = await _accountService.getAll();
      print(listAccount);
    } on ClientException catch (clientException){
      print("Não foi possivel alcança ro servidor");
      print("Tente novamente mais tarde");
      print(clientException.message);
      print(clientException.uri);
    }
      on Exception{
        print("Não consegui recuperar os dados da conta ");
        print("Tente mais tarde");
    } finally{
      print("${DateTime.now()} | Ocorreu uma tentattica da consulta.");
    }
  }

  _addExampleAccount() async{
    Account example = Account(
      id: "ID2",
      name: "Beatriz",
      lastName: "Alencar",
      balance: 25000
    );

    await _accountService.addAccount(example);
  }
}

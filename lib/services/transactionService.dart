import 'dart:async';

import 'package:dart_assincronismo/models/account.dart';
import 'package:dart_assincronismo/services/account_services.dart';

class Transactionservice {
  AccountService _accountService = AccountService();

  makeTransation({
    required String idSender,
    required String idReceiver,
    required double amount,
  }) async {
    List<Account> listAccount = await _accountService.getAll();

    Account senderAccount = listAccount.firstWhere((
      acc) => acc.id == idSender,
    );

    Account receiverAccount = listAccount.firstWhere((
      acc) => acc.id == idReceiver,
    );

    print(senderAccount);
    print(receiverAccount);
  }
}
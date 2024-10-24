// lib/helpers/helper_taxes.dart

import 'package:dart_assincronismo/models/account.dart';

double calculateTaxesByAccount({
  required Account account,
  required double amount
  }) {

  if (amount < 5000) return 0;

  switch (account.accountType) {
    case 'Ambrosia':
      return amount * 0.005; // 0.5% para Ambrosia
    case 'Canjica':
      return amount * 0.0033; // 0.33% para Canjica
    case 'Pudim':
      return amount * 0.0025; // 0.25% para Pudim
    case 'Brigadeiro':
      return amount * 0.0001; // 0.01% para Brigadeiro
    default:
      return 0.1; // Caso o tipo de conta não seja reconhecido
  }
}

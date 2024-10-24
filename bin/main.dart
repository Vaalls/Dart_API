import 'package:dart_assincronismo/models/transaction.dart';
import 'package:dart_assincronismo/screens/account.screen.dart';
import 'package:dart_assincronismo/services/transactionService.dart';

void main(){
  Transactionservice().makeTransation
  (idSender: "New01",
  idReceiver: "ID010",
  amount: 5001
  );
  // AccountScreen accountScreen = AccountScreen();
  // accountScreen.initializeStream();
  // accountScreen.runChatBot();
}

// void main(){
//   print("Começou a main");
//   funciona01();
//   print("Finalizou a main");
// }

// void funciona01() {
//   print("Começou a função 01");
//   funciona02();
//   print("Finalizou a função 01");
// }

// void funciona02() {
//   print("Começou a função 02");
//   for (var i = 1; i < 5; i++) {
//     print(i);
//   }
//   print("Finalizou a função 02"); 
// }


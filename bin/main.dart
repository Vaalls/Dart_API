import 'package:dart_assincronismo/screens/account.screen.dart';

void main(){
  AccountScreen accountScreen = AccountScreen();
  accountScreen.initializeStream();
  accountScreen.runChatBot();
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


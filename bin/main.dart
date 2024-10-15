import 'package:dart_assincronismo/screens/account.screen.dart';

void main(){
  AccountScreen accountScreen = AccountScreen();
  accountScreen.initializeStream();
  accountScreen.runChatBot();
}


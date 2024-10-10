import 'package:http/http.dart';
void main(){
  // print("Olá mundo");
  requestData();
}

// Conectando nossa aplicação a web
requestData(){
  String url = "https://gist.githubusercontent.com/Vaalls/7c1c19cba87f199ab0cbe3bfcd87f1b0/raw/5fdd0d7c1ec75380c8a0bdb6c60cbcd8aa51f953/accounts.json";
  print(get(Uri.parse(url)));
}
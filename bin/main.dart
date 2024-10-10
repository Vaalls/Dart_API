import 'package:http/http.dart';
import 'dart:convert';

void main(){
  // print("Olá mundo");
  //requestData();
  requestDataAsync();
}

// Conectando nossa aplicação a web
requestData(){
  String url = "https://gist.githubusercontent.com/Vaalls/7c1c19cba87f199ab0cbe3bfcd87f1b0/raw/5fdd0d7c1ec75380c8a0bdb6c60cbcd8aa51f953/accounts.json";
  Future<Response> futureResponse = get(Uri.parse(url));
  print(futureResponse);
  futureResponse.then(
    (Response response) {
    //Tudo até linha 23 esta agendado para acontecer, depois que o get for achado...
     print(response);
     print(response.body);
     List<dynamic> listAccounts = json.decode(response.body);
     Map<String, dynamic> mapCarla = listAccounts.firstWhere
     ((element) => element["name"] == "Carla",
     );
     print(mapCarla["balance"]);
    },
  );

  print("Ultima coisa a acontecer na aplicação.");
}

requestDataAsync() async{
  String url = "https://gist.githubusercontent.com/Vaalls/7c1c19cba87f199ab0cbe3bfcd87f1b0/raw/5fdd0d7c1ec75380c8a0bdb6c60cbcd8aa51f953/accounts.json";
  Response response = await get(Uri.parse(url));
  //Só passa para a linha 35 após finalizar o get
  print(json.decode(response.body)[0]);
  print("De fato, vai ser a ultima coisa a acontecer na função.");
}
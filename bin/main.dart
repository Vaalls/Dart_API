import 'dart:async';
import 'package:dart_assincronismo/api.dart';
import 'package:http/http.dart';
import 'dart:convert';

StreamController<String> streamController = StreamController<String>();

void main(){
  StreamSubscription streamSubscription = 
    streamController.stream.listen((String info) {
    print(info);
    },);

  //requestData();
  //requestDataAsync();
  // sendDataAsync({
  //   "id": "New01",
  //   "name": "Flutter",
  //   "lastName": "Dart",
  //   "balance": 5000
  // });
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

Future<List<dynamic>> resquestDataAsync() async{
  String url = "https://gist.githubusercontent.com/Vaalls/7c1c19cba87f199ab0cbe3bfcd87f1b0/raw/5fdd0d7c1ec75380c8a0bdb6c60cbcd8aa51f953/accounts.json";
  Response response = await get(Uri.parse(url));
  return json.decode(response.body);
}

sendDataAsync(Map<String, dynamic> mapAccount) async{
  List<dynamic> listAccount = await resquestDataAsync();
  listAccount.add(mapAccount);
  String content = jsonEncode(listAccount);

  String url ="https://api.github.com/gists/7c1c19cba87f199ab0cbe3bfcd87f1b0";

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
  print(response.statusCode);
}
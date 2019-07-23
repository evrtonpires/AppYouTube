import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtub/models/video.dart';

const API_KEY = "AIzaSyAOSP-NccyNOQDd-nDScagJ27nYSjvbkQY";

/*
"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"

"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"

"http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"
 */


class Api {

  pesquisar(String caminho) async{

    http.Response response = await http.get(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$caminho&type=video&key=$API_KEY&maxResults=10"
    );

    return decode(response);
  }

  List<Video> decode(http.Response response){
    if(response.statusCode == 200){
      var decoded = json.decode(response.body);
//pegando os items que é uma lista de maps, pega cada mapa utilizando o comando map,
//para cada um dos mapas é chamado uma funcao anonima

      List<Video> videos = decoded["items"].map<Video>(
          (map){
            return Video.fromJson(map);
            //pega cada mapa e transforma em um video
          }
          //no final transformou em uma lista de videos
      ).toList();
      return videos;
    }
    else{
      throw Exception("Falha ao carregar videos!");
    }
  }
}
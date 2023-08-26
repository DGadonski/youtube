// ignore_for_file: file_names, prefer_interpolation_to_compose_strings, constant_identifier_names

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/video.dart';

const CHAVE_YOUTUBE_API = 'AIzaSyDT8E7JNDe9xiF7YvqpmkLw8Nh8DRN9Lkg';
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {

  Future<List<Video>> pesquisar(String? pesquisa) async {

    http.Response response = await http.get(Uri.parse(
      URL_BASE + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$CHAVE_YOUTUBE_API"
      "&channelId=$ID_CANAL"
      "&q=$pesquisa"
      )
    );

    Map<String, dynamic> dadosJson = jsonDecode(response.body);

    List<Video> videos = dadosJson['items'].map<Video>(
      (map){
        return Video.fromJson(map);
        // return Video.converterJson(map);
      }).toList();

    return videos;
    
    // for (var video in videos) {

    //   print(video.titulo);
      
    // }

    // for (var video in dadosJson['items']) {

    //   print(video);
      
    // }

    // if ( response.statusCode == 200) {

    //   print(response.statusCode);
    //   print(dadosJson['items'][0]['snippet']['title']);

    // } else {}

  }

}